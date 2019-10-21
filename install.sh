for fullpath in $PWD/*
do
	f="$(basename -- $fullpath)"
	if ! [ "$f" = "install.sh" ]; then
		echo "Installing to ~/.$f"
		ln -s ~/.dotfiles/$f ~/.$f
	fi
done
