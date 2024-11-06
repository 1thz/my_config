
source ~/.config/nvim/autoload/plug.vim " Script to download plugins
source ~/.config/nvim/vim-plug/plugins.vim " configured plugins

source ~/.config/nvim/general/settings.vim " configured vim configs (i.e. set)
source ~/.config/nvim/general/mappings.vim " custom mappings of keys

if exists('g:vscode')
  source ~/.config/nvim/vscode/settings.vim
  source ~/.config/nvim/plug-config/sneak.vim " sneak config
  "source ~/.config/nvim/plug-config/easymotion.vim  " to decide whether to delete or not
else
  " Ordinary neovim
end

