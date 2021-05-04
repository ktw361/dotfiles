for fullpath in $PWD/*
do
	f="$(basename -- $fullpath)"
	if ! [ "$f" = "install.sh" ]; then
        target=~/.$f
		echo "Installing to $target"
        if [[ -f "$target" ]]; then
            backup=~/.$f.backup
            echo "Backup old -> $backup"
            cp ~/.$f ~/.$f.backup
        fi
        ln -sf ~/.dotfiles/$f ~/.$f
        echo ""
	fi
done
