#!/usr/bin/env bash

 # will globally set up the pre-commits. every future git clone will set up the pre-commit too

if [[ "${1:-}" == "win" ]]; then
    template_file=pre-commit-config.yaml.windows.j2
    homepath="$(echo ${HOME:2})"
    # homepath="${homepath////\\}"
    # homepath="$(echo $HOME | sed 's|/|\\|g')"
else
    template_file=pre-commit-config.yaml.j2
    homepath=$HOME
fi

config_file=.pre-commit-config.yaml


sed "s|HOME|$homepath|g" "$template_file" >| "$config_file"
echo "Created $config_file from $template_file"

mkdir -p $HOME/.git-templates

git config --global init.templatedir $HOME/.git-templates

cp -v -R -p hooks $HOME/.git-templates/

mkdir -p $HOME/lint-configs
cp -v -R -a configs/. $HOME/lint-configs/.

cp -v -a $config_file $HOME/$config_file
chmod +x $HOME/$config_file
chmod +x $HOME/.git-templates/hooks/pre-commit
