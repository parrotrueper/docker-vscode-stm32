# Docker Image for VS Code STM32 devcontainer development

## Setup

* Install stlink-tools `sudo apt install stlink-tools`
* Install Docker Engine
* Instal Visual Code
* Pull the Docker image

### WSL extra setup

* Enable WSL USB device sharing.
* Install [USBIPD-WIN](https://github.com/dorssel/usbipd-win/releases)
* Follow the instructions in the [README](https://github.com/dorssel/usbipd-win/blob/master/README.md)


## Pull the Docker image

```shell
docker pull parrotrueper/stm32vscode:14.3
```

## Setup VS Code

* Install `ms-vscode-remote.remote-containers` extension on VS Code
* Open the directory in a dev container
`Ctrl+Shift+P` -> `Dev Containers: Open Folder in Container...`

## Example

### Tasks for Blinky

See `.vscode/tasks.json`

### Build Debug

`Ctrl+Shift+B` -> `Build Debug Blinky App`

### Debugging

* Plug stlink to the target
* Connect the stlink to the host
* Build Debug Blinky App
* On WSL open a terminal, attach the usb `usbipd attach --wsl --busid=<busid>`
and start the gdb server `st-util`
* F5 starts the session

### Debugging key shortcuts

* F5 Continue
* F10 Step over
* F11 Step into
* Shift F11 Step Out
* Ctrl+Shift+F5 Restart
* Shift+F5 Stop


### Build Release

Builds the target without debug symbols

`Ctrl+Shift+B` -> `Build Release Blinky App`

### Clean

`Ctrl+Shift+B` -> `Clean`

## Modifying the Docker image

Make your edits to `Dockerfile`, and `.env`.

### Build

`./build-image.sh`
