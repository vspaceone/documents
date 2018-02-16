# Documents

## Build

Once (replace user with your username)
* docker build -t vspacedocs .
* docker run -it -v /path/to/repository:/build --name vspacedocs vspacedocs

Since then
* docker start vspacedocs

The container will exit as soon as all files are built.

## Usage
