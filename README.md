Firstly, I will install Memcached in a docker container running in my Windows 10 desktop machine. Where I have a Windows Docker Client installed, running in the “Linux Container” mode.


docker pull memcached

Secondly, I will create and run a container from the image, exposing the port 11211; so I can access from the application I am about

docker run -p 11211:11211 -d memcached


