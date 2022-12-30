local packer = require('packer')

packer.use {
  'nvim-orgmode/orgmode',
  requires = {
    'nvim-treesitter/nvim-treesitter',
    'akinsho/org-bullets.nvim',
    'dhruvasagar/vim-table-mode',
    'lukas-reineke/headlines.nvim',
  },
  config = function()
    require('headlines').setup()
    require('org-bullets').setup()
    require('orgmode').setup_ts_grammar()
    require('orgmode').setup()
  end
}
