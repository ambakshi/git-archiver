#!/bin/bash
#
# Simple bash implementation of git ls-tree. The magic hash '4b..' represents
# and empty tree.
#
# Amit Bakshi
# 04/01/2013
#

git_lstree () {
    local -a LINE
    git cat-file -p $2 | while IFS=$' \t' read -a  LINE; do
        if [[ ${LINE[1]} =~ tree ]] && [[ ${LINE[2]} != 4b825dc642cb6eb9a060e54bf8d69288fbee4904 ]]; then
            git_lstree "$1${LINE[3]}/" ${LINE[2]}
        else
            printf '# %s # %-6s # %s # %s%s\n' ${LINE[0]} ${LINE[1]} ${LINE[2]} $1 ${LINE[3]}
        fi
    done
}



git_lstree "" `git rev-parse HEAD^{tree}`
