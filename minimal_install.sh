cur_dir=$(dirname "$0")

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
