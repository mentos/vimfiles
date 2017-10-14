# mentos' vimfiles

This is a collection of gVim/mVim plugins, along with their configuration. For the most part, it uses [pathogen](https://github.com/tpope/vim-pathogen) & [git submodules](https://git-scm.com/docs/git-submodule).

## Fresh Installation

For installing these vimfiles on a fresh `vim` installation you will need to run:


```
$ ~ git clone https://github.com/mentos/vimfiles ~/.vim
$ ~ cd ~/.vim
$ ~ bash bootstrap
```

The bootstrap files contains the following commands:

```
$ ~ curl -LSso ./autoload/pathogen.vim https://tpo.pe/pathogen.vim
$ ~ ln -s ~/.vim/vimrc ~/.vimrc
$ ~ git submodule update --init
```

What's happening in there is self-explanatory.

Now you can `vim`, `mvim` or `gvim` on your terminal and enjoy this configuration.

## Existing installation

This setup will *not* play nicely with existing configuration. You'll have to figure out and merge configuration manually. It's highly suggested to backup your existing configuration:

```
$ mv ~/.vimrc{,.bak}
$ mv ~/.vim{,.bak}
```

## Maintenance

Use `git submodule update --recursive --remote` inside `.vim/` to update all submodules to the latest vesion.

You can remove a submodule by following [these](https://stackoverflow.com/a/1260982/635033) steps:

1. Delete the relevant section from the `.gitmodules` file
2. Stage the `.gitmodules` changes `git add .gitmodules`
3. Delete the relevant section from `.git/config`
4. Run `git rm --cached path_to_submodule` (no trailing slash)
5. Run `rm -rf .git/modules/path_to_submodule`
6. Commit `git commit -m "Removed submodule <name>"`
7. Delete the now untracked submodule files `rm -rf path_to_submodule`

> https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial#Removal

Every time you update or remove a submodule, don't forget to run `curl -LSso ./autoload/pathogen.vim https://tpo.pe/pathogen.vim` so it picks up the latest changes.
