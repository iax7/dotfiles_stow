# dotfiles

Look for [Chezmoi managed dotfiles](https://github.com/iax7/dotfiles)

## Usage ⚙️

```bash
git clone git@github.com:iax7/dotfiles_stow.git ~/.dotfiles
cd ~/.dotfiles
./init-small.sh
```

## Clean up / Uninstall 🔥

```bash
cd
find . -maxdepth 1 -type l -exec rm -v {} \;
```

© Copyright 2022-2026 iax7
