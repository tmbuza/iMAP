#!/usr/bin/env bash

#!/usr/bin/env bash

# Declare variables
imageName=tmbuza/imapapp:soft1.0
containerName=installsoft1.0

sudo docker build -t $imageName -f Dockerfile  .

