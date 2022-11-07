import os
from pathlib import Path
import subprocess
import json


def exec_git(path: str, args: list):
    cmd = ["git", "-C", path]
    cmd.extend(args)
    result = subprocess.run(cmd, stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8').strip()


def list_plugins(root: str, type: str):
    path = os.path.join(root, type)
    dirs = os.listdir(path)
    list = []
    for file in dirs:
        plugin_path = os.path.join(path, file)
        commit_id = exec_git(plugin_path, ["rev-parse", "--short", "HEAD"])
        list.append({"name": file, "commit": commit_id})

    return sorted(list, key=lambda plugin: plugin["name"])


if __name__ == "__main__":
    home_dir = Path.home()
    plugin_root = os.path.join(home_dir, ".local/share/nvim/site/pack/packer")
    opt_list = list_plugins(plugin_root, "opt")
    start_list = list_plugins(plugin_root, "start")
    data = {"opt": opt_list, "start": start_list}
    with open("snapshot", "w") as f:
        json.dump(data, f)
