#/usr/bin/env bash

template_file=.pre-commit-config.yaml.j2
config_file=.pre-commit-config.yaml

sed "s|HOME|$HOME|g" "$template_file" > "$config_file"
echo "Created $config_file from $template_file"

mkdir -p $HOME/.git-templates

git config --global init.templatedir $HOME/.git-templates

cp --verbose -R -p hooks $HOME/.git-templates/

cp --verbose -R -a configs/. $HOME/lint-configs/.

cp --verbose -a $config_file $HOME/$config_file
