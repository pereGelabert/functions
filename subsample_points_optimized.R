
# Function to subsample points based on minimum distance
subsample_points <- function(s, distancia = 800) {
  require(sf)
  require(dplyr)

  
  restantes <- s
  seleccionados <- list()
  
  while(nrow(restantes) > 0) {
    
    # set random point
    p <- restantes %>% slice_sample(n=1)
    
    # Keep random selected point
    seleccionados[[length(seleccionados) + 1]] <- p
    
    # Exclussion buffer
    buffer_p <- st_buffer(p, distancia)
    
    # Filter out-buffered points
    restantes <- restantes %>%
      filter(!st_intersects(geometry, buffer_p, sparse=FALSE))
  }
  
  # Merge out-buffered points
  final <- do.call(rbind, seleccionados)
  
  return(final)
}
