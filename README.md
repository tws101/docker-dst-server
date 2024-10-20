# Don't Starve Together Dedicated Server Docker Image

Please read the whole document before putting your hands on your server. 
Special thanks to Jamesits who's repository I forked.

----------

## Versioning

The Master Branch is a standard DST server with the cave shard.  The "latest" tag is recommended but pinned versions of the previous release tags are offered.
[docker-compose](https://github.com/tws101/docker-dst-server/blob/master/docker-compose.yml)

The Slim Branch is for users that want the image without DST installed lowering the image size from 2.7gigs down to less than 70megs.  On container run DST will be downloaded and installed from scratch.
[docker-compose](https://github.com/tws101/docker-dst-server/blob/slim/docker-compose.yml)

The Island Branch is DST with the Island of Adventure mods and dependencies installed this is a 4 shard server.  Tag "island-latest"
[docker-compose](https://github.com/tws101/docker-dst-server/blob/develop-island/docker-compose.yml)


* You may see versions with dev tags these are not recomended.

## Running

### Prerequisites

 * Linux x86_64 and runs Docker (18.05.0-ce or later).
 * Head end router needs a public IP to make your server accessible from Internet. 
 * Ports forwarded through head end router to docker host UDP 10999-11000. On islands these are 11001-11004 UDP.
 * 5GiB available disk space is recommended.  Saves and config are small docker image is 4.3 Gigs.
 * CPU: 1 core per shard Recomended (can do higher tick rate and player count).  1 core per 2 shards is possible (keep tick rate and player count low).
 * Memory: 2GiB Memory per shard recommended (can do higher tick rate and player count).  1GiB Memory per shard is possible (keep tick rate and player count low).
 * Path on Docker Host to hold the server config.  User and Group ID 1000 is how the container will access the path so set your permssion on it accordingly.

### Start server

Please use docker compose to start the server.
DST Standard
[docker-compose](https://github.com/tws101/docker-dst-server/blob/master/docker-compose.yml)
DST Island of Adventure
[docker-compose](https://github.com/tws101/docker-dst-server/blob/develop-island/docker-compose.yml)

### Stop server

A docker stop command, whether at the command line or in Dockge or Portainer will properly shut the server down.

To programmatically shut down the server, send a SIGINT to the `supervisord` process. 

Note: the server may take up to ~5min to save map and fully shut down.
 
## Server Configuration

If you don't already have a set server config in your data directory, we will generate one for you. Start server once using the command above, and you will see:
```
Creating default server config...
Please fill in `DoNotStarveTogether/Cluster_1/cluster_token.txt` with your cluster token and restart server!
```

To generate a cluster token (as of 2019-11-02):

1. Open a genuine copy of Don't Starve Together client and log in
2. Click "Play" to go to the main menu
3. click "account" button on the bottom left of the main menu
4. In the popup browser, click "GAMES" on the top nav bar
5. Click "Don't Starve Toegther Servers" button on the top right
6. Scroll down to "ADD NEW SERVER" section, fill in a server name (it is not important), and copy the generated token

The token looks like `pds-g^aaaaaaaaa-q^jaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=`. Then either set `DST_CLUSTER_TOKEN` environment variable during `docker run`, or paste the token into `your_data_directory/DoNotStarveTogether/Cluster_1/cluster_token.txt`.

If you need to add mods, change world generation config, etc., please do it now. Don't forget to edit `your_data_directory/DoNotStarveTogether/Cluster_1/cluster.ini` and get your server an unique name!

After you finish this, re-run start server command, and the server should be running.

## FAQ

#### How to update server or mods?

Restart the server. Updates will be downloaded automatically.

#### How to connect to a LAN only server?

Run `c_connect("IP address", port)` or `c_connect("IP address", port, "password")` in client console.

#### How to check if the server is online?

You can try the 3rd party website [Don't Starve Together Server List](https://dstserverlist.appspot.com).

#### What port does this server require?

You need to expose UDP 10999 (master) and 11000 (caves) for client to connect; udp 12346 and 12347 for steam connection. Don't NAT these ports to different port numbers.  Please see Island compose for its seperate port numbers.

The server use another 2 high UDP ports for unknown communication, and UDP 10998 (listen on localhost) for communication between cluster servers.

Here is a `netstat -tulpn` output on our test server:
```
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
udp        0      0 0.0.0.0:12346           0.0.0.0:*                           54/./dontstarve_ded 
udp        0      0 0.0.0.0:12347           0.0.0.0:*                           53/./dontstarve_ded 
udp        0      0 0.0.0.0:38223           0.0.0.0:*                           53/./dontstarve_ded 
udp        0      0 0.0.0.0:36517           0.0.0.0:*                           54/./dontstarve_ded 
udp        0      0 127.0.0.1:10998         0.0.0.0:*                           54/./dontstarve_ded 
udp        0      0 0.0.0.0:10999           0.0.0.0:*                           54/./dontstarve_ded 
udp        0      0 0.0.0.0:11000           0.0.0.0:*                           53/./dontstarve_ded 
```

#### Error! App '343050' state is 0x202 after update job.

Your disk is full.

#### Error! App '343050' state is 0x602 after update job.

Usually there is a file system permission issue preventing steamcmd from writing to your game installation directory.

#### Client high latency or lagging

Possible causes:

* High packet drop rate
* High server tick rate with low-performance clients (e.g. notebook users with tick rate 60) 

#### How can I copy local data to server?

Local data is stored in `<User Documents>\Klei\DoNotStarveTogether\<Random Number>`.

There are two situations:
1. Local data has cave enabled.\
Just copy the `Cluster_X` to server and rename to `Cluster_1`, then it should work.
2. Local data has no cave.\
Copy everything in `client_save` except `session` and `Cluster_X/save/session` to server `Cluster_1/save`.\
If your local data is not in slot 1, you also have to modify `saveindex` because the server recognize only the first slot.\
The server will create a cave for you. If you don't want the cave, you have to modify `supervisor.conf` to disable cave server.

#### How can I enable mods after copy local data to server?

Open `Cluster_X/Master/modoverrides.lua` and you will see something like `workshop-XXXXX` where `XXXXX` is a number.\
Open `Cluster_1/mods/dedicated_server_mods_setup.lua` on server and write `ServerModSetup("XXXXX")`.
 
## Thanks

 * [James Swineson](https://swineson.me)
 * [Mingye Wang](https://github.com/Arthur2e5)
 * [@MephistoMMM](https://github.com/MephistoMMM)
 * [@m13253](https://github.com/m13253)
 * [@wph95](https://github.com/wph95)
 * [DaoCloud](https://daocloud.io)
 * [CodeVS](http://codevs.cn/)
 * [I Choose Death Too](https://steamcommunity.com/id/ichoosedeathtoo/)

## References

 * [How to setup dedicated server with cave on Linux](https://steamcommunity.com/sharedfiles/filedetails/?id=590565473)
 * [How to install,configure and update mods on Dedicated Server](https://steamcommunity.com/sharedfiles/filedetails/?id=591543858)
 * [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD)
