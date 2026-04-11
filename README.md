# pre-commit configs help

## Setting up 

```shell
mkdir -p $HOME/.git-templates
git config --global init.templateDir '$HOMe/.git-templates'
cp --verbose -R -a lint-configs/* $HOME/lint-configs/
```

## Bypass the annoying lint during commits
```git commit -m "your commit message" --no-verify```
