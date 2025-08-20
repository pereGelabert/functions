

subsample_points <- function(s, distancia = 800) {
  require(sf)
  require(dplyr)

  
  restantes <- s
  seleccionados <- list()
  
  while(nrow(restantes) > 0) {
    
    # Elegir punto aleatorio
    p <- restantes %>% slice_sample(n=1)
    
    # Guardar seleccionado
    seleccionados[[length(seleccionados) + 1]] <- p
    
    # Buffer de exclusión
    buffer_p <- st_buffer(p, distancia)
    
    # Filtrar puntos fuera del buffer
    restantes <- restantes %>%
      filter(!st_intersects(geometry, buffer_p, sparse=FALSE))
  }
  
  # Unir todos los puntos seleccionados
  final <- do.call(rbind, seleccionados)
  
  return(final)
}
