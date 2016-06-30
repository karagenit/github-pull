# Github Pull Script

This script is designed to pull from github.

It has the ability to either use Github SSH Deploy Keys for verification, or manual username/password entry.

It is intended to be run either via a cronjob or to be called by a webhook.

Though, to be honest, any sane person would just add the repo as a `submodule` and call `git submodule update --remote --merge` via the cronjob or webhook script. 
