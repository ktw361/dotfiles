cur_dir=$(cd $(dirname "$0") && pwd)

echo "Copying minimal_vimrc"
if [[ -f ~/.vimrc ]]; then
    cp ~/.vimrc ~/.vimrc.backup
fi
ln -sf ${cur_dir}/minimal_vimrc ~/.vimrc

echo "Copying tmux.conf"
if [[ -f ~/.tmux.conf ]]; then
    cp ~/.tmux.conf ~/.tmux.conf.backup
fi
ln -sf ${cur_dir}/tmux.conf ~/.tmux.conf

echo "Copying minimal_bashrc"
cp ~/.bashrc ~/.bashrc.backup
ln -sf ${cur_dir}/minimal_bashrc ~/.bashrc
