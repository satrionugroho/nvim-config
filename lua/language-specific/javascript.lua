local packer = require('packer')

packer.use {
  'yuezk/vim-js',
  requires = {
    'maxmellon/vim-jsx-pretty',
    'HerringtonDarkholme/yats.vim'
  },
  ft = { 'js', 'jsx', 'ts', 'tsx' },
  config = function()
    vim.api.nvim_set_var('vim_jsx_pretty_colorful_config', 1)
  end
}
