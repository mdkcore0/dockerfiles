# Node.js
Scripts to run `npm` and `npx` from the official
[node docker images](https://hub.docker.com/_/node/) \o/

## Running:
- npm:
    ```
    $ ./npm.sh [ARGS]
    ```

- npx:
    ```
    $ ./npx.sh [ARGS]
    ```

The commands will run *npm*/*npx* following any argument, bind-mounting the
current directory inside the node container and set *userid*/*groupid* to match
the host current user. Also, publish any port it needs using the host network.

This will always run the **latest** node version, but you can adjust by setting
the version you want at the command line:

```
$ VERSION=14.6 ./npx.sh [...]
```

A use case is to put `npm.sh` and/or `npx.sh` on your *PATH* environment
variable and call it from anywhere on your system, like this (here `~/.bin` is
already on my `$PATH`):
```
$ cd ~/.bin
$ ln -s /PATH/TO/THIS/DOCKERFILE/npm.sh npm
$ cd /PATH/TO/YOUR/PROJECT
$ npm start
```
