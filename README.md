# subsample_points

## Description
`subsample_points` selects a subset of points from an `sf` points object based on minimum and optional maximum distance thresholds. It ensures that:

- No two retained points are closer than the specified **minimum distance**.
- Optionally, points farther apart than a **maximum distance** can be removed.

This is useful for reducing spatial point density or ensuring a uniform spatial distribution.

## Usage
```r
subsample_points(points, min_dist, max_dist = NULL)
