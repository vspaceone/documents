# Documents

## Build

Once
* docker build -t vspacedocs .
* docker run -it -v /home/damian/projects/documents:/build --name vspacedocs vspacedocs

Since then
* docker start vspacedocs

The container will exit as soon as all files are built.

## Usage
