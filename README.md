### Vimfiles

A collection of plugins and configuration for (g)Vim that I've come up so far.

#### New installation

In case you haven't set up vim run the execute commands:


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

Now you can `vim` or `gvim` on your terminal and enjoy this configuration.

#### Existing installation

Before you move on and install these vimfile it would be nice if you backed up your existing configuration first. You can do so with:

```
$ mv ~/.vimrc{,.bak}
$ mv ~/.vim{,.bak}
```

Now in case you don't like what this configuration provides you can revert to your old configuration.
