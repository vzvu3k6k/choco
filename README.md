# NAME

dirmove - move around directories.

# SYNOPSIS

    # General movement with peco
    $ m

    # Optional movement with sentaku
    $ m s

    # Selecet a directory where you want to go.
    # If you've reached there, quit or kill process.
    # `m` is an example name. See also: Installation.

# DESCRIPTION

直感的な操作でディレクトリの深い階層へ進みます。

# DEMO

### peco
![dirmove_peco](https://dl.dropboxusercontent.com/u/7779513/dirmove/dirmove_peco.gif)

### sentaku
![dirmove_sentaku](https://dl.dropboxusercontent.com/u/7779513/dirmove/dirmove_sentaku.gif)

# Installation

    # Install
    $ cd
    $ git clone git@github.com:note103/dirmove.git

    # Edit .bashrc
    function m {
        if [ "$1" = "s" ] ; then
            DIR=$(perl ~/dirmove/dirmove.pl s);
        else
            DIR=$(perl ~/dirmove/dirmove.pl);
        fi
    
        if [ -n "$DIR" ] ; then
            cd "$DIR"
        fi
    }

    # `m` is an example name. Replace it with that you want.

# REQUIREMENT

- [peco](https://github.com/peco/peco)

## OPTION

- [sentaku](https://github.com/rcmdnk/sentaku)

# LICENSE

Copyright (C) Hiroaki Kadomatsu.  
This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

# AUTHOR

Hiroaki Kadomatsu (@note103)

- [Blog](http://note103.hateblo.jp/)
- [Twitter](https://twitter.com/note103)