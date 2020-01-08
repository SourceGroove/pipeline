docker pull dperny/tasknuke
docker run -v /var/run/docker/swarm/control.sock:/var/run/swarmd.sock dperny/tasknuke $1
