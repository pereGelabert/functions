**Funcions:**
   - [subsample points](#subsample_points.R)
   - [subsample points optimized version](#subsample_points_optimized.R (Optimized Version))
   - [FIRERES Priority Utility Functions Transformation](https://github.com/pereGelabert/functions/blob/main/README.md#fireres-utility-transformations)


# subsample_points.R

## Description
`subsample_points` selects a subset of points from an `sf` points object based on minimum and optional maximum distance thresholds. It ensures that:

- No two retained points are closer than the specified **minimum distance**.
- Optionally, points farther apart than a **maximum distance** can be removed.

This is useful for reducing spatial point density or ensuring a uniform spatial distribution.

## Usage
```r
subsample_points(points, min_dist, max_dist = NULL)
```
# subsample_points_optimized.R (Optimized Version)

## Description
This optimized version of `subsample_points` selects a subset of points from an `sf` object such that no two points are closer than a specified **minimum distance**.  

It uses a **randomized iterative approach**:

1. Randomly selects a point from the remaining points.  
2. Keeps that point and removes all other points within the specified minimum distance.  
3. Repeats until no points remain.  

This method is often faster and more memory-efficient than computing a full distance matrix.

## Usage
```r
subsample_points(s, dist = 800)
```

# FIRERES Utility Transformations

These functions transform raw environmental or project variables into **utility functions** agreed upon by an expert committee (FIRERES project). Two types of transformations are provided:

1. **Sigmoidal Utility (`sig`, `sig_r`)**  
   Maps values to [0,1] based on expert-defined thresholds (`rmin`, `rmax`).  
   - Values ≤ `rmin` → 0  
   - Values ≥ `rmax` → 1  
   - Values in between are normalized linearly

2. **Linear Utility (`lin`, `lin_r`)**  
   Rescales values linearly to [0,1] based on the range of the dataset.

## Functions

- `sig(r, rmin, rmax)` – Transform numeric vectors using a sigmoidal utility.  
- `lin(r)` – Transform numeric vectors linearly to [0,1].  
- `sig_r(r, rmin, rmax)` – Apply sigmoidal transformation to raster data.  
- `lin_r(r)` – Apply linear transformation to raster data.

## Examples

```r
# Vector example
raw_values <- c(10, 25, 50, 75, 100)
sig(raw_values, rmin = 20, rmax = 80)
lin(raw_values)

# Raster example
library(terra)
r <- rast(matrix(runif(100), 10, 10))
sig_r(r, rmin = 0.2, rmax = 0.8)
lin_r(r)
```
