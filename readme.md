Building a Docker image of a single standalone instance on Meshblu with Redis and MongoDB (in the container).

Install Ubuntu Server  and install the latest Docker:

1.	Install Ubuntu in the VM (14.04 LTS Server) or 14.10
2.	Add OpenSSH Server
3.	Determine IP
4.	Connect over SSH
5.	Update
6.	sudo apt-get update
7.	Upgrade the components (aka patch the OS)
8.	sudo apt-get upgrade -y
9.	Add Docker gpg key (that is 'qO' not 'qZero')
10.	sudo sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -" 
11.	Update the app list
12.	sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ >> /etc/apt/sources.list.d/docker.list"
13.	Update the local apt repository after adding the docker reference
14.	sudo apt-get update
15.	Install (latest) Docker (on 12/15/14 this is 1.4.0)
16.	sudo apt-get install lxc-docker -y

Pull the latest build from Github:
17. git clone https://github.com/brianehlert/meshblu_docker.git
(Git should be installed, error if it is not – then run 'sudo apt-get install git')

Build the container
18.	cd meshblu
19.	sudo docker build -t meshblu .

Run the container interactively (you have a console and have to open another terminal to manage Docker, good for debug)
20.	sudo docker run -i -t -p 3000:3000 -p 5683:5683 meshblu
(this maps the container port to the matching host port - note one command per port)

Test that Meshblu is running
21.	sudo docker ps  (list running Docker containers)
22.	curl http://localhost:3000/status    (should output:    {"meshblu":"online"}  )

An alternate to steps 17 – 19 is to build directly from Github
1.	sudo docker build github.com/brianehlert/meshblu_docker.git 
2.	sudo docker images   ( find the image ID )
3.	sudo docker run -t -p 3000:3000 -p 5683:5683 <image id>
