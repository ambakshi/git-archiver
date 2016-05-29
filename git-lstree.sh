#!/bin/bash
#
# The MIT License (MIT)
#
# Copyright (c) 2014 cnpm
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# https://github.com/ambakshi/git-archiver
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
