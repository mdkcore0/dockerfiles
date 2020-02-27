# OpenVINO + OpenCV
This folder contains an OpenVINO installation (based on the [official documentation](https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_docker_linux.html)), and a OpenCV variant (python bindings)

**NOTE**: This will install only the CPU runtime for the Inference Engine.

## Building:
- openvino:
    ```
    $ ./build.sh
    ```

- openvino-opencv:
    Build `openvino` and then:
    ```
    $ ./build-opencv.sh
    ```

## Running:
- openvino:
    ```
    $ ./run.sh
    ```
    This will put you on the container command line, inside OpenVINO's installation directory, as root.

- openvino-opencv:
    ```
    $ ./run-opencv.sh
    ```
    The issued command will put you inside the container, on the `/opt/src` directory, that is a bind-mount volume from the current host directory, and set *userid*/*groupid* to match the host current user too.

    This allow you to develop your code on your machine and use the container to run the actual code; any output generated you be available on your current directory as well.

    A use case is to put `run-opencv.sh` on your *PATH* environment variable and call it fom anywhere on your system, like this (here `~/.bin` is already on my `$PATH`):
    ```
    host $ cd ~/.bin
    host $ ln -s /PATH/TO/THIS/DOCKERFILE/run-opencv.sh openvino
    host $ cd /PATH/TO/YOUR/PROJECT
    host $ openvino
    container:/opt/src $
    ```

    **NOTE**: This container runs using the `openvino` user, that maps to your actual user on your host machine.

    **NOTE2**: As "normal" user you can not perform `root` operations, but can use `sudo` and install any package in need as the `root` user (password: **openvino**), but keep on mind that any system modification (i.e., any modification outside `/opt/src`) will be lost once exiting the container, as they are disposable (there are ways on keep a container running, but it is out of scope here :grin:).

### Example:
![](./images/openvino-opencv.png)

### Pulling the image from github:
I've uploaded the **openvino-opencv** image to this repository as a package; this is my first time doing so and I thought anyone could download the image easily, but it's not so straightforward: you need to login to *GitHub Packages* in order to be able to pull the image :/

I didn't like this approach, hope they change it in the future... but if you still interested on doing so, do the follow:

- authenticate to [GitHub Packages](https://help.github.com/en/packages/using-github-packages-with-your-projects-ecosystem/configuring-docker-for-use-with-github-packages#authenticating-to-github-packages)
- pull the image:
    ```
    $ docker pull docker.pkg.github.com/mdkcore0/dockerfiles/openvino-opencv:latest
    ```
- and run:
    ```
    $ docker run --rm --user "$UID:$(id -g)" -it -v $PWD:/opt/src docker.pkg.github.com/mdkcore0/dockerfiles/openvino-opencv
    ```
    or using the *run-opencv.sh* script:
    ```
    $ IMAGE=docker.pkg.github.com/mdkcore0/dockerfiles/openvino-opencv ./run-opencv.sh
    ```

## Notes:
Will update this dockerfile according my use, so stay tuned ;)

Also, feel free to make suggestions and report any issue found :)
