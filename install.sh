cur_dir=$(cd $(dirname "$0") && pwd)

for fullpath in $PWD/*
do
	f="$(basename -- $fullpath)"
	if ! [ "$f" = "install.sh" ]; then
        target=~/.$f
        if [[ -f "$target" ]]; then
            backup=~/.$f.backup
            echo "Backup old -> $backup"
            cp ~/.$f ~/.$f.backup
        fi
        echo "ln -sf ${cur_dir}/$f ~/.$f"
        ln -sf ${cur_dir}/$f ~/.$f
        echo ""
	fi
done
