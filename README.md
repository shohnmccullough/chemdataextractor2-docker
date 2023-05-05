# chemdataextractor2-docker
Docker Container for chemdataextractor2 v 2.1.2

# Notes
1. Ensure the docker container will have at least 35GB disk space available, ``` pip install chemdataextractor2 ```
    will rapidly fill up disk space, particularly while installing ``` allennlp ```, which downloads dozens of boto* packages.
    
2. The build will take at least 40 minutes on average to complete.

# Build
``` docker build -t [IMAGE_NAME] Dockerfile ```
