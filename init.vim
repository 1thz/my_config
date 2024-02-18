
source $USERPROFILE\.config\nvim\autoload\plug.vim " Script to download plugins
source $USERPROFILE\.config\nvim\vim-plug\plugins.vim " configured plugins

source $USERPROFILE\.config\nvim\general\settings.vim " configured vim configs (i.e. set)
source $USERPROFILE\.config\nvim\general\mappings.vim " custom mappings of keys

if exists('g:vscode')
  source $USERPROFILE\.config\nvim\vscode\settings.vim
  source $USERPROFILE\.config\nvim\plug-config\sneak.vim " sneak config
  "source $USERPROFILE\.config\nvim\plug-config\easymotion.vim  " to decide whether to delete or not
else
  " Ordinary neovim
end

