#!/usr/bin/env python
import os
import argparse
from pathlib import Path
from simple_pipes import pipe_call

parser = argparse.ArgumentParser("Sensor data parser")
parser.add_argument("--project" help="Project", required=True)
parser.add_argument("--env" help="Environment", required=True)
parser.add_argument("--droplet_count" help="Droplet count", required=True)
parser.add_argument("--ssh_dir" help="SSH directory", required=True)

if __name__ == "__main__":
    args = parser.parse_args()
    Path(args.ssh_dir).mkdir(parents=True, exist_ok=True)

    for count in range(args.droplet_count):
        target = os.path.join(args.ssh_dir, f"{args.project}-{args.env}-{args.count}")
        pipe_call(["ssh-keygen", "-N", "", "-f", target])
