#!/usr/bin/python3

import os
import sys
from pathlib import Path
import subprocess
import json

home_dir = Path.home()
nvim_dir = os.path.join(home_dir, ".config/nvim")
plugin_dir = os.path.join(home_dir, ".local/share/nvim/site/pack/packer")
snapshot_path = os.path.join(nvim_dir, "snapshot.json")

types = ["start", "opt"]
type_paths = {}
for type in types:
    type_paths[type] = os.path.join(plugin_dir, type)


def exec_cmd(name: str, args: list, input: str):
    cmd = [name]
    cmd.extend(args)
    if input == "":
        result = subprocess.run(cmd, stdout=subprocess.PIPE)
    else:
        result = subprocess.run(cmd,
                                stdout=subprocess.PIPE,
                                input=input.encode())

    return result.stdout.decode('utf-8').strip()


def exec_git(path: str, args: list):
    if path != "":
        git_args = ["-C", path]
    else:
        git_args = []
    git_args.extend(args)
    return exec_cmd("git", git_args, "")


def build():
    result = {}
    for type in types:
        plugins = []
        type_path = type_paths[type]
        names = os.listdir(type_path)
        for name in names:
            plugin_path = os.path.join(type_path, name)
            commit_id = exec_git(plugin_path, ["rev-parse", "--short", "HEAD"])
            plugins.append({"name": name, "commit": commit_id})
        plugins = sorted(plugins, key=lambda plugin: plugin["name"])
        result[type] = plugins
    with open(snapshot_path, "w") as f:
        json.dump(result, f, indent=2)


def load():
    with open(snapshot_path, "r") as f:
        data = json.load(f)
    return data


def list():
    results = []
    data = load()
    for type in types:
        plugins = data[type]
        type_path = type_paths[type]
        for plugin in plugins:
            path = os.path.join(type_path, plugin["name"])
            results.append({
                "name": plugin["name"],
                "commit": plugin["commit"],
                "path": path
            })
    return results


def rollback():
    plugins = list()
    for plugin in plugins:
        path = plugin["path"]
        if not os.path.exists(path):
            print(
                "Error: plugin path {} not exists, please run PackerInstall in nvim first"
                .format(path))
            exit(1)
        cur_commit_id = exec_git(path, ["rev-parse", "--short", "HEAD"])
        if cur_commit_id == plugin["commit"]:
            print("{}: {} is up to date".format(type, plugin["name"]))
            continue
        exec_git(path, ["reset", "--hard", plugin["commit"]])
        print("{}: {} set to {}".format(type, plugin["name"],
                                        plugin["commit"]))


def search():
    plugins = list()
    names = []
    name_map = {}
    for plugin in plugins:
        names.append(plugin["name"])
        name_map[plugin["name"]] = plugin
    names_str = '\n'.join(names)
    result = exec_cmd("fzf", [], names_str)
    return name_map[result]


def home():
    plugin = search()
    print(plugin["path"])


def update():
    plugin = search()
    exec_git(plugin["path"], ["pull"])
    print("update {} done".format(plugin["path"]))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("invalid args")
        exit(1)
    action = sys.argv[1]
    if action == "build":
        build()
    elif action == "rollback":
        rollback()
    elif action == "home":
        home()
    elif action == "update":
        update()
    else:
        print("unknown action {}".format(action))
        exit(1)
