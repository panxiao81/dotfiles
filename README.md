# Panxiao81 Dotfiles

- .zshrc 
- nvim
- Package automatic install (support ubuntu and archlinux)
- starship

Use GNU Stow to manage dotfiles.

```sh
stow -S nvim
stow -S zsh
stow -S starship
./package.sh
```

