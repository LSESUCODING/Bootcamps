install.packages("rgl")
library(rgl)
open3d() # create a new plot
spheres3d(x = 0, y = 0, z = 0, radius = 1) # unit sphere centered at origin
axes3d() # add axes