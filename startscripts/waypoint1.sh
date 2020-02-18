#!/bin/bash

. /opt/workspace/devel/setup.bash

rosservice call /rexrov/go_to "{waypoint: {point: {x: 10.0, y: 10.0, z: -10.0}, max_forward_speed: 10}, max_forward_speed: 10}"