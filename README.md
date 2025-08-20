# subsample_points.R

## Description
`subsample_points` selects a subset of points from an `sf` points object based on minimum and optional maximum distance thresholds. It ensures that:

- No two retained points are closer than the specified **minimum distance**.
- Optionally, points farther apart than a **maximum distance** can be removed.

This is useful for reducing spatial point density or ensuring a uniform spatial distribution.

## Usage
```r
subsample_points(points, min_dist, max_dist = NULL)

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
subsample_points(s, distancia = 800)

