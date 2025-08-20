#' Subsample Spatial Points Based on Minimum and Maximum Distance
#'
#' This function selects a subset of points from an `sf` points object such that:
#'   - No two points are closer than a specified minimum distance (`min_dist`).
#'   - Optionally, only points within a maximum distance (`max_dist`) from each other are retained.
#'
#' @param points An `sf` object containing point geometries (POINT type).
#' @param min_dist Numeric. Minimum allowed distance between points. Units are in meters.
#' @param max_dist Numeric or NULL. Optional maximum distance threshold. Points farther than this distance are removed. Units are in meters.
#'
#' @return An `sf` object containing the subsampled points that satisfy the distance constraints.
#'
#' @details
#' The function works as follows:
#' 1. Converts `min_dist` and `max_dist` to `units::set_units("m")`.
#' 2. Computes the full pairwise distance matrix between points using `sf::st_distance`.
#' 3. Iteratively checks each point:
#'    - Retains the point.
#'    - Removes all points closer than `min_dist`.
#'    - If `max_dist` is provided, removes points farther than `max_dist`.
#' 4. Returns only the points marked as retained.
#'
#' @examples
#' library(sf)
#' # Create sample points
#' points <- st_as_sf(data.frame(x = runif(10), y = runif(10)), coords = c("x", "y"), crs = 4326)
#' # Subsample with a minimum distance of 0.01 meters
#' subsampled <- subsample_points(points, min_dist = 0.01)
#' 
#' # Subsample with min and max distance
#' subsampled <- subsample_points(points, min_dist = 0.01, max_dist = 0.05)
#'
#' @import sf
#' @import units
#' @export

# Function to subsample points based on minimum and optional maximum distance
subsample_points <- function(points, min_dist, max_dist = NULL) {
  # Load necessary libraries
  require(sf)
  require(units)
  
  # Ensure min_dist has units
  min_dist <- set_units(min_dist, "m")
  
  # If max_dist is provided, ensure it has units
  if (!is.null(max_dist)) {
    max_dist <- set_units(max_dist, "m")
  }
  
  # Calculate pairwise distances between all points
  distance_matrix <- st_distance(points)
  
  # Initialize a logical vector to keep track of which points to retain
  keep <- rep(TRUE, nrow(points))
  
  # Iteratively remove points that violate the distance constraints
  for (i in seq_len(nrow(points))) {
    if (keep[i]) {
      # Points that are too close (violating min_dist)
      close_points <- which(distance_matrix[i, ] < min_dist & keep)
      
      # Set the nearby points to FALSE (remove them)
      keep[close_points] <- FALSE
      keep[i] <- TRUE  # Keep the current point
      
      # If max_dist is provided, retain only points within the maximum distance
      if (!is.null(max_dist)) {
        far_points <- which(distance_matrix[i, ] > max_dist & keep)
        keep[far_points] <- FALSE
      }
    }
  }
  
  # Subset the points to retain only those that meet the criteria
  subsampled_points <- points[keep, ]
  
  return(subsampled_points)
}
