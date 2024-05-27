#!/usr/bin/env python
import argparse
import os
from pathlib import Path
from .keys import ssh_key
from simple_pipes import pipe_call

parser = argparse.ArgumentParser("Sensor data parser")
parser.add_argument("--project", help="Project", required=True)
parser.add_argument("--env", help="Environment", required=True)
parser.add_argument("--droplet_count", help="Droplet count", required=True)
parser.add_argument("--ssh_dir", help="SSH directory", required=True)


if __name__ == "__main__":
    args = parser.parse_args()
    Path(args.ssh_dir).mkdir(parents=True, exist_ok=True)

    for i in range(args.droplet_count):
        pipe_call(
            [
                "ssh-keygen",
                "-N",
                "",
                "-f",
                ssh_key(args.ssh_dir, args.project, args.env, i),
            ]
        )
