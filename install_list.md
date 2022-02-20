## Install stuff cool list

* bat : a better cat with colors
* imgcat : print image in the console!
* nvim : obviously the best editor hands-down  
* ripgrep: better grep.
* tldr : amazing help tool.
* zsh-autosuggestions: fish style console suggestions.
* shellcheck: checks your shell if is correct.
* tree or broot: trees of directories is great to check project 
* fzf fuzzy search for directory
* fasd is a must: Helps you to jump everywhere
* fd is a replace for search is also very useful
* sshfs is an application to mount folders for a server. Very very convenient.

### TMUX

You can create scripts for sessions and look extremely useful
example:

```code
if tmux has-session -t yancy; then
tmux new-window -t yancy:2
  tmux split-window -t yancy:2 -v
  tmux send-keys -t yancy:1 vim Enter
### ADD SOME MORE CRAZY CONFIG HERE ###
fi
tmux attach -t yancy
```
### ITERM 2
Also a very viable option. Can setup session with little problem
install powerlevel10K is an amazing theme for the console and is
very easy to configure.

Sessions need to be configured in the terminal. Coc is also pretty good

### VIM must have plugins

WIP
