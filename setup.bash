#!/usr/bin/env bash

# run execute the Dockerfile or pulled image
# docker run -it tmbuza/r-base:1.0 /bin/bash
# # or 
# docker run --name=r-base --rm -ti tmbuza/r-base:1.0 /bin/bash -v $(pwd):/home/$USER/bin/

docker run --name=imap --rm -ti tmbuza/imap:1.2 /bin/bash