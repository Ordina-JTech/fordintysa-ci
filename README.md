![fordintysa logo](http://www.bertkoor.nl/fordintysa.png)

# Workshop Continuous Integration

This repository contains everything you need for the workshop Continuous Integration, developed by Ordina JTech for Fontys Hogeschool.

Using Docker we'll spin up a preconfigured build server on your own computer, containing GitLab, Jenkins with Maven and Artifactory.

The Java software we're going to build is also contained in this repository. You can use your favorite IDE and Git client, or edit directly the source code in GitLab. More on that later.

## Prerequisites

  * Windows 7/8/10 (64-bit)
  * or Mac OS/X
  * or any Linux distribution
  * about 20 GB free disk space

#### Linux users
You should be able to run the workshop with 'native' Docker. See the [official Docker site](https://docs.docker.com/engine/installation/linux/) for installation instructions.
You can go directly to step 3 of Getting Started.

#### 32bit versions of Windows
You can try a manual install of the components making up the Docker Toolbox: Oracle VirtualBox, Boot2Docker, Docker Machine, etc. This is not tested, and you probably will be busy for an hour to get it running. Maybe better do some [Pair Programming](https://en.wikipedia.org/wiki/Pair_programming) with a neighbour.

## Getting Started

### 1. Install the Docker Toolbox

  * Visit [https://www.docker.com/docker-toolbox](https://www.docker.com/docker-toolbox)
  * Download and run the installer for your operating system
  * You can unselect the following components, as we're not using them:
      * Docker Compose
	  * Kitematic
	  * Git (if you already have a working Git client)

#### Windows machines with restricted free space on the C drive
We'll arrange that most of the Docker storage lands on a different drive where you *do* have enough free space. Skip this section if you have plenty (about 20 GB) free space on your C drive.

  * Using Windows explorer, create a folder on a disk with more than 20GB free space (e.g. `D:\docker-machines`)
  * Move the folder `C:\Users\<username>\.docker\machine` to your created directory.
  * Open a Command prompt with administrator rights
      - <div style="font-size: 0.8em">Windows **Start** menu, type `cmd`, right-click `cmd.exe`, click *"run as administrator"* </div>
  * Create a symbolic link on the original location and point it to the location where your data is stored by pasting the following command:
```
mklink /D c:\Users\<username>\.docker\machine d:\docker-machines\machine
```

### 2. Run the Docker QuickStart terminal

![docker quickstart icon](http://www.bertkoor.nl/docker_quickstart.png) You'll find this icon on your desktop to start the Docker QuickStart Terminal

 * A virtual machine called `default` machine has started, but that one's not gonna cut it for this workshop. Stop it to save precious system resources by typing the following command:
```
docker-machine stop default
```

 * Instead of the dinky `default` machine we'll create one with 4 CPU cores instead of one, 8 GB RAM instead of one, and connected to our private Docker Registry:
```
docker-machine create fordintysa-ci --driver virtualbox --virtualbox-cpu-count "4" --virtualbox-memory "8192" --engine-insecure-registry 172.18.18.32/32 --engine-registry-mirror http://172.18.18.32:5000
```
(TODO: change IP address of private Docker registry)

 * Now you can login to the newly created VM with ssh (Secure Shell) as follows:
```
docker-machine ssh fordintysa-ci
```

### 3. Clone the Git repository

 * Clone this repository and checkout branch `infra` with the following command:
```
git clone https://github.com/ordina-jtech/fordintysa-ci.git -b infra
```
(TODO: change to GitHub repo)

 * Within the virual machine the storage of the user's home directory is volatile. So when the virtual machine reboots, everything stored there is lost. So it's better to move the repo to a persistent location:
```
sudo mv fordintysa-ci /mnt/sda1/
```
   Ofcourse Linux users can skip this step (or move the repo to a location of their own choice)
 * Now we have to make this new location our current directory:
```
cd /mnt/sda1/fordintysa-ci
```

### 4. Start the magic script


 * Now you can execute the magic script:
```
./open.sh
```

Magic spells often don't work the first time you try, but I'm sure you'll figure it out!

What to do next will be explained by the script once it has started.

## Known Problems

Where shall we start...

## Clean shutdown of the containerized build server

TODO

## Starting the containerized build server again

TODO
