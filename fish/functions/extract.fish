function extract
    set ext zip rar bz2 gz tar tbz2 tgz Z 7z xz exe tar.bz2 tar.gz tar.xz lzma

    if test -z "$argv"
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|lzma>"
        return
    end

    if not test -f "$argv"
        echo $argv "- file does not exist"
        return
    end

    switch $argv
        case "*.$ext[1]"
            unzip ./$argv
        case "*.$ext[2]"
            unrar x -ad ./$argv
        case "*.$ext[3]"
            bunzip2 ./$argv
        case "*.$ext[4]"
            gunzip ./$argv
        case "*.$ext[5]"
            tar xvf ./$argv
        case "*.$ext[6]"
            tar xvjf ./$argv
        case "*.$ext[7]"
            tar xvzf ./$argv
        case "*.$ext[8]"
            uncompress ./$argv
        case "*.$ext[9]"
            7z x ./$argv
        case "*.$ext[10]"
            unxz ./$argv
        case "*.$ext[11]"
            cabextract ./$argv
        case "*.$ext[12]"
            tar xvjf ./$argv
        case "*.$ext[13]"
            tar xvzf ./$argv
        case "*.$ext[14]"
            tar xvJf ./$argv
        case "*.$ext[15]"
            unlzma ./$argv
        case '*'
            echo "extract: $argv - unknown archive method"
    end
end
