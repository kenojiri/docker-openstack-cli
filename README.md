# Open Stack CLI in an Alpine based Docker container

[@rupakg](https://github.com/rupakg) (Rupak Ganguly) declares in [his repository](https://github.com/rupakg/openstack-cli/blob/master/README.md),

>Best way to run the Openstack CLI is to run it inside a Docker container which eliminates amy dependency hell and polluting your own machine.

I absolutely agree with it.

And today we can use the [Alpine base image on Docker hub](https://hub.docker.com/_/alpine/) to economize the total image size. Pull faster, and run on small footprints.

Alpine Linux does not distribute OpenStack CLI packages but python3 packages, so [pip](https://pip.pypa.io/en/stable/) is needed to install OpenStack CLIs.

These are because I recompose Dockerfile using Alpine base image and pip.

## Configuration

[@rupakg](https://github.com/rupakg) (Rupak Ganguly) says in [his README](https://github.com/rupakg/openstack-cli/blob/master/README.md),

> The easiest way to get the CLI configured is to set the environment variables using the OpenStack RC file. And, to keep the configuration flexible, we will mount the config RC file onto the docker container and then source it inside.

Yes, I follow the method.

### Download the OpenStack RC file

[@rupakg](https://github.com/rupakg) (Rupak Ganguly) says in [his README](https://github.com/rupakg/openstack-cli/blob/master/README.md),

> Log in to the OpenStack dashboard, choose the project for which you want to download the OpenStack RC file, on the Project tab, open the Compute tab and click Access & Security.
On the API Access tab, click Download OpenStack RC File and save the file. The filename will be of the form PROJECT-openrc.sh where PROJECT is the name of the project for which you downloaded the file.
Create a 'config' folder and copy the 'PROJECT-openrc.sh' there. We will mount this config RC file when we run the container.

Yes, I follow the method.

## Run the CLI

```
# get the openstack cli image
docker pull ozzozz/openstack-cli

# run the docker container mounting the config file from the location $(pwd)/config  
docker run -it -v $(pwd)/config:/config ozzozz/openstack-cli /bin/bash

# source the config file and input your password
$ source /config/PROJECT-openrc.sh

# test the cli
$ openstack --version
```
