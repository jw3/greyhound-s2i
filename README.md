Greyhound Point Cloud s2i
===

Goal to automate the building and serving of point cloud through Greyhound by using configuration as code in git repo.


There is a repo with sample sources here https://github.com/jw3/example-lidar-sources

To serve that example data in OpenShift do a 

`#! oc new-app jwiii/greyhound-s2i~https://github.com/jw3/example-lidar-sources.git --name=greyhound `

### See
- https://github.com/hobu/greyhound
- https://github.com/connormanning/entwine
- https://vimeo.com/245073446

### Sample Data
- https://entwine.io/sample-data/red-rocks.laz
