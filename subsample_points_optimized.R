#' Subsample Points with Minimum Distance (Optimized)
#'
#' This function selects a subset of points from an `sf` object such that no two points
#' are closer than a specified minimum distance. It uses a randomized iterative approach
#' for improved performance over full pairwise distance calculations.
#'
#' @param s An `sf` object containing point geometries (`POINT` type).
#' @param dist Numeric. Minimum allowed distance between points, in the same units as the CRS (default: 800).
#'
#' @return An `sf` object containing the subset of points that satisfy the minimum distance.
#'
#' @details
#' The function works as follows:
#' 1. Initializes the remaining points as all points in `s`.
#' 2. Iteratively:
#'    - Randomly selects a point from the remaining points.
#'    - Keeps the selected point.
#'    - Removes all other points within the buffer defined by `distancia`.
#' 3. Repeats until no points remain.
#' 4. Returns all retained points as a single `sf` object.
#'
#' This method is more memory-efficient than computing a full distance matrix for large datasets.
#'
#' @examples
#' library(sf)
#' library(dplyr)
#'
#' # Create sample points
#' points <- st_as_sf(data.frame(x = runif(20), y = runif(20)), coords = c("x", "y"), crs = 4326)
#'
#' # Subsample with a minimum distance of 800 units
#' subsampled <- subsample_points(points, distancia = 800)
#'
#' @import sf
#' @import dplyr
#' @export
subsample_points <- function(s, dist = 800) {
  require(sf)
  require(dplyr)

  
  rest <- s
  selected <- list()
  
  while(nrow(rest) > 0) {
    
    # set random point
    p <- rest %>% slice_sample(n=1)
    
    # Keep random selected point
    selected[[length(selected) + 1]] <- p
    
    # Exclussion buffer
    buffer_p <- st_buffer(p, dist)
    
    # Filter out-buffered points
    rest <- rest %>%
      filter(!st_intersects(geometry, buffer_p, sparse=FALSE))
  }
  
  # Merge out-buffered points
  final <- do.call(rbind, selected)
  
  return(final)
}
