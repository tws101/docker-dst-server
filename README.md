# Don't Starve Together dedicated server (Docker)

Fork of [Jamesits/docker-dst-server](https://github.com/Jamesits/docker-dst-server).

Three image variants. Use Docker Compose; do not start from a raw `docker run` unless you already know the env vars.

## Variants

| Branch / tag | What you get | Compose |
|---|---|---|
| `master` / `latest` | Standard DST with cave shard. Prefer `latest`; older release tags are pinned. | [docker-compose.yml (master)](https://github.com/tws101/docker-dst-server/blob/master/docker-compose.yml) |
| `slim` / `slim-latest` | Image only (~70 MB). DST is downloaded on first container start (full image is ~2.7 GB). | [docker-compose.yml (slim)](https://github.com/tws101/docker-dst-server/blob/slim/docker-compose.yml) |
| `island` / `island-latest` | Island of Adventure mods and dependencies. Four shards. | [docker-compose.yml (island)](https://github.com/tws101/docker-dst-server/blob/island/docker-compose.yml) |

Tags containing `dev` are not supported.

## Requirements

- Linux x86_64 with Docker 18.05 or later (Compose recommended).
- Public IPv4 on the edge router if the server should be reachable from the internet.
- Port forwards, **UDP only**, 1:1 (do not remap):
  - Standard / slim: `10999–11000`
  - Island: `11001–11004`
  - Also needed: `12346–12347/udp` (Steam)
- Disk: ~5 GiB free. Save data is small; the baked image is on the order of 3–4 GiB.
- CPU: 1 core per shard recommended; 1 core per 2 shards is possible at low tick rate and player count.
- RAM: 2 GiB per shard recommended; 1 GiB per shard is possible at low tick rate and player count.
- A host directory for config/saves. The container runs as UID/GID **1000**; chown that path accordingly.

## Start and stop

Start with the compose file for your variant (links above).

Stop with `docker compose stop` / `docker stop`, or SIGINT to `supervisord`. The process can take up to about five minutes to save and exit. Tools such as Dockge or Portainer issue a normal Docker stop and are fine.

## First-run configuration

If the data directory has no cluster config, the container writes defaults and then exits with:
```
Creating default server config...
Please fill in DoNotStarveTogether/Cluster_1/cluster_token.txt with your cluster token and restart server!
```


### Cluster token

Login to your Klei Account then to go [Klei DST Cluster Token Creator](https://accounts.klei.com/account/game/servers?game=DontStarveTogether)

The token looks like `pds-g^…-q^…=`.

Either:

- set `DST_CLUSTER_TOKEN` in Compose, or
- write the token to `your_data_directory/DoNotStarveTogether/Cluster_1/cluster_token.txt`.

Then edit `cluster.ini` (unique server name), add mods / worldgen if needed, and start the container again.

## FAQ

**Update the game or mods?**

Restart the container. Updates download on start.

**Connect to a LAN-only server?**

Client console: `c_connect("IP", port)` or `c_connect("IP", port, "password")`.

**Is the server listed?**

Third-party list: [dstserverlist.appspot.com](https://dstserverlist.appspot.com).

**Which ports?**

Clients use UDP 10999 (master) and 11000 (caves) on the standard image; Island uses 11001–11004. Steam uses UDP 12346–12347. Do not NAT those to different numbers.

Two additional high UDP ports are used internally. UDP 10998 is bound on localhost for shard-to-shard traffic and must not be published.

Example `netstat -tulpn`:

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
 
## Credits

James Swineson, Mingye Wang ([Arthur2e5](https://github.com/Arthur2e5)), [MephistoMMM](https://github.com/MephistoMMM), [m13253](https://github.com/m13253), [wph95](https://github.com/wph95), DaoCloud, CodeVS, [I Choose Death Too](https://steamcommunity.com/id/ichoosedeathtoo/).

## References

- [Dedicated server with caves on Linux](https://steamcommunity.com/sharedfiles/filedetails/?id=590565473)
- [Mods on a dedicated server](https://steamcommunity.com/sharedfiles/filedetails/?id=591543858)
- [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD)
