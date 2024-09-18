

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
