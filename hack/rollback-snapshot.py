import os
from pathlib import Path
import subprocess
import json


def exec_git(path: str, args: list):
    cmd = ["git", "-C", path]
    cmd.extend(args)
    result = subprocess.run(cmd, stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8').strip()


def rollback_plugins(root: str, type: str, plugins: list):
    root = os.path.join(root, type)
    for plugin in plugins:
        plugin_path = os.path.join(root, plugin["name"])
        if not os.path.exists(plugin_path):
            print(
                "Error: plugin path {} not exists, please run PackerInstall in nvim first"
                .format(plugin_path))
            exit(1)
        cur_commit_id = exec_git(plugin_path, ["rev-parse", "--short", "HEAD"])
        if cur_commit_id == plugin["commit"]:
            print("{}: {} is up to date".format(type, plugin["name"]))
            continue
        exec_git(plugin_path, ["reset", "--hard", plugin["commit"]])
        print("{}: {} set to {}".format(type, plugin["name"],
                                        plugin["commit"]))


if __name__ == '__main__':
    home_dir = Path.home()
    plugin_root = os.path.join(home_dir, ".local/share/nvim/site/pack/packer")
    with open("snapshot", "r") as f:
        data = json.load(f)
    opt_list = data["opt"]
    start_list = data["start"]
    rollback_plugins(plugin_root, "opt", opt_list)
    rollback_plugins(plugin_root, "start", start_list)
