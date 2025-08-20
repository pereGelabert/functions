#' Calculate LS Factors (Slope Length and Steepness) from a DEM
#'
#' This function computes the USLE/European method LS factors from a digital elevation model (DEM).
#' The LS factor is the product of slope length (L) and slope steepness (S), which are essential
#' for soil erosion modeling.
#'
#' @param dem SpatRaster object (from `terra`) representing the Digital Elevation Model.
#' @param temp_dir Character string. Path to a temporary directory for intermediate raster files.
#'                 If the directory does not exist, it will be created.
#'
#' @return A list of SpatRaster layers:
#'   - `Lfactor` : Slope length factor
#'   - `Sfactor` : Slope steepness factor
#'   - `LSfactor`: Combined LS factor (L × S)
#'
#' @details
#' The function:
#'   - Computes slope in degrees
#'   - Fills depressions in the DEM and calculates flow accumulation using `whitebox`
#'   - Converts slope to radians and limits extreme values
#'   - Calculates β and m parameters
#'   - Computes the L (length) factor and S (slope) factor
#'   - Returns the LS factor as L × S
#'
#' @examples
#' library(terra)
#' dem <- rast("path/to/dem.tif")
#' temp_dir <- "path/to/temp_dir"
#' LS_layers <- calcular_LS(dem, temp_dir)
#' plot(LS_layers$LSfactor)
#' 
#' @import terra
#' @import whitebox
#' @export
get_RUSLE_LS <- function(dem, temp_dir) {
  library(terra)
  library(whitebox)
  
  if (!dir.exists(temp_dir)) {
    dir.create(temp_dir, recursive = TRUE)
  }
  
  slope <- terrain(dem, v = "slope", unit = "degrees")
  
  slope_path <- file.path(temp_dir, "slope.tif")
  demF_path <- file.path(temp_dir, "dem_filled.tif")
  facc_path <- file.path(temp_dir, "flow_acc.tif")
  
  writeRaster(dem, file.path(temp_dir, "dem.tif"), overwrite = TRUE)
  
  wbt_fill_depressions(dem = file.path(temp_dir, "dem.tif"), output = demF_path)
  wbt_d8_flow_accumulation(input = demF_path, output = facc_path, out_type = "cells")
  
  flow_acc <- rast(facc_path)
  
  slope_rad <- sin(slope * (pi/180))
  slope_rad <- ifel(tan(slope_rad) >= 50, NA, slope_rad)
  
  beta <- (slope_rad / 0.0896) / (0.56 + 3 * sin(slope_rad)^0.8)
  m_param <- beta / (beta + 1)
  
  FACTOR_L <- ((flow_acc + (res(dem)[1]^2))^(m_param + 1) - (flow_acc)^(m_param + 1)) /
    ((res(dem)[1]^(m_param + 2)) * (22.13^m_param) * (cos(slope_rad) * sin(slope_rad))^m_param)
  names(FACTOR_L) <- "Lfactor"
  
  slope_tan <- tan(slope_rad)
  slope_sin <- sin(slope_rad)
  
  FACTOR_S <- ifel(slope_tan < 0.09,
                   10.8 * slope_sin + 0.03,
                   16.8 * slope_sin - 0.5)

  names(FACTOR_S) <- "Sfactor"
  # Factor LS
  FACTOR_LS <- FACTOR_L * FACTOR_S
  names(FACTOR_LS) <- "LSfactor"
  # Devolver como lista de capas raster
  return(c(
    FACTOR_L,
    FACTOR_S,
    FACTOR_LS
  ))
}
