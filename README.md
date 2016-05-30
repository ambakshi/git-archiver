git-archiver
=============

    A git subcommand to recursively archive a repo containing
    submodules. The git clones of the bare repos are cached
    in --git-base (default: $HOME/.git-archiver/repos)

    $ cd my-repo && git-archiver HEAD > out.tar
    $ git-archiver --git-dir=my-repo master > master.tar
    $ git-archiver --git-dir=my-repo develop:sub/dir > subdir.tar
    $ git-archiver --git-dir=my-repo --skip-fix | tar xi -C /path/to/extract
    $ git-archiver --git-dir=my-repo | gzip | tar zx -C /path/to/extract

Amit Bakshi
ambakshi@gmail.com
4/30/2013

