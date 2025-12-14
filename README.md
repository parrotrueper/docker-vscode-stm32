# Docker Image for VS Code STM32 devcontainer development

## Setup

* Install stlink-tools `sudo apt install stlink-tools`
* Install Docker Engine
* Instal Visual Code
* Pull the Docker image

```shell
docker pull parrotrueper/stm32vscode:14.3
```

* Install `ms-vscode-remote.remote-containers` extension on VS Code
* Open the directory in a dev container
`Ctrl+Shift+P` -> `Dev Containers: Open Folder in Container...`

## Tasks Example Blinky

### Build Debug

`Ctrl+Shift+B` -> `Build Debug Blinky App`

### Debugging

* Plug stlink to the target
* Connect the stlink to the host
* Build Debug Blinky App
* F5

### Build Release

Builds the target without debug symbols

`Ctrl+Shift+B` -> `Build Release Blinky App`

### Clean

`Ctrl+Shift+B` -> `Clean`

## Modifying the Docker image

Make your edits to `Dockerfile`, and `.env`.

### Build

`./build-image.sh`
