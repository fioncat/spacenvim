import os
from pathlib import Path
import subprocess
import json


def exec_git(path: str, args: list):
    cmd = ["git", "-C", path]
    cmd.extend(args)
    result = subprocess.run(cmd, stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8').strip()


def search_plugin(root, data):
    names = []
    path_map = {}
    for type in data:
        plugins = data[type]
        for plugin in plugins:
            name = plugin["name"]
            names.append(name)
            path = os.path.join(root, type, name)
            path_map[name] = path

    names_str = '\n'.join(names)
    result = subprocess.run(["fzf"],
                            input=names_str.encode(),
                            stdout=subprocess.PIPE)
    select_name = result.stdout.decode('utf-8').strip()
    print(path_map[select_name])


if __name__ == '__main__':
    home_dir = Path.home()
    plugin_root = os.path.join(home_dir, ".local/share/nvim/site/pack/packer")
    snapshot_path = os.path.join(home_dir, ".config", "nvim", "snapshot")
    with open(snapshot_path, "r") as f:
        data = json.load(f)
    search_plugin(plugin_root, data)
