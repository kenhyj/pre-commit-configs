# pre-commit configs help

```shell
mkdir -p $HOME/.git-templates
cp --verbose -R -a lint-configs/* $HOME/lint-configs/
```

to bypass the annoying lint during commits
```git commit -m "your commit message" --no-verify```
