# Future me, please dont store any passwords or keys here uwu
# ~/.bashrc
#

# Fix WSL's PATH polluted by windows executables

# Split the PATH variable into an array using ":" as the delimiter
IFS=':' read -ra path_array <<< "$PATH"

# Iterate through the array and remove items starting with "/mnt/"
for i in "${!path_array[@]}"; do
    if [[ "${path_array[$i]}" == "/mnt/"* ]]; then
        unset 'path_array[$i]'
    fi
done

# Join the array elements back into a colon-separated string
new_path=$(IFS=':'; echo "${path_array[*]}")

# Update the PATH variable
export PATH="$new_path"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[38;5;75m\]\u@\[\033[38;5;39m\]\h\[\033[0m\]:\[\033[38;5;51m\]\w\[\033[0m\]\$ '

# Aliases
alias ls=exa
alias "tree=exa --tree"
alias "cat=bat -n"
alias "ll=ls -la"
alias "edit=helix"
alias "ebrc=edit ~/.bashrc"
alias "rbrc=source ~/.bashrc"
alias "pacget=sudo pacman -S"
alias "hx=helix"
alias "sudofy=sudo echo \"You can now use sudo!\""

# External tools
eval "$(zoxide init bash)"

