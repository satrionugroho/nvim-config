require('bootstrap')

-- reset before using
require('packer').reset()

local use = require('packer').use

-- make neovim faster
use { 'lewis6991/impatient.nvim' }

-- packer not remove when clean up
use { 'wbthomason/packer.nvim', opt = true }

-- plugin that use for other plugins
use { 'nvim-lua/plenary.nvim' }
use { 'nvim-tree/nvim-web-devicons' }
use { 'tpope/vim-commentary' }

-- lsp setup
use {
  'neovim/nvim-lspconfig',
  config = function()
    local opts = { noremap=true, silent=true }
    local map = vim.keymap.set

    -- keymappings
    map('n', '<space>e', vim.diagnostic.open_float, opts)
    map('n', '[d', vim.diagnostic.goto_prev, opts)
    map('n', ']d', vim.diagnostic.goto_next, opts)
    map('n', '<space>q', vim.diagnostic.setloclist, opts)
  end
}

-- autoinstall lsp
use {
  'williamboman/mason.nvim',
  requires = {
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  },
  run = function()
    require('config.mason-postinstall')
  end,
  config = function()
    require('config.mason-config')
  end
}

use {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup()
  end
}

use {
  'jedrzejboczar/possession.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
}

-- Telescope
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/popup.nvim',
    'rcarriga/nvim-notify',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  wants = {
    'popup.nvim',
    'plenary.nvim',
  },
  setup = function()
    require('config.telescope.setup')
  end,
  config = function()
    require('config.telescope.config')
  end,
  cmd = 'Telescope',
  module = 'telescope'
}

-- Treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  requires = {
    'RRethy/nvim-treesitter-textsubjects',
    'RRethy/nvim-treesitter-endwise',
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  run = function()
    local install = require('nvim-treesitter.install')
    install.prefer_git = true
    install.update({ with_async = true })
  end,
  config = function()
    require('config.treesitter')
  end
}

-- Folding
use {
  'kevinhwang91/nvim-ufo',
  requires = {
    'kevinhwang91/promise-async',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('config.nvim-ufo')
  end
}

use { 'anuvyklack/fold-preview.nvim',
  requires = 'anuvyklack/keymap-amend.nvim',
  config = function()
    require('fold-preview').setup()
    vim.keymap.set('n', '<space>s', ':lua require("fold-preview").show_preview()<cr>', { noremap = true, silent = false })
  end
}

-- File browser
use {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'windwp/nvim-ts-autotag',
  }
}

-- status line
use {
  'nvim-lualine/lualine.nvim',
  requires = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'nightfly'
      }
    })
  end
}

-- Git integration
use {
  'lewis6991/gitsigns.nvim',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    require('gitsigns').setup({
      current_line_blame = true
    })
    vim.api.nvim_set_keymap('n', '<space>g', [[<cmd>Gitsigns preview_hunk<cr>]], { noremap = true, silent = false })
  end
}

use {
  'TimUntersberger/neogit',
  requires = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  opt = true,
  cmd = 'Neogit',
  config = function()
    require('neogit').setup({
      integrations = {
        diffview = true
      }
    })
  end
}

-- completions
use {
  'hrsh7th/nvim-cmp',
  requires = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'neovim/nvim-lspconfig', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
    { 'hrsh7th/vim-vsnip', after = 'nvim-cmp' },
  },
  config = function()
    require('config.nvim-cmp')
  end
}

-- theme
use {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup({
      integrations = {
        leap = false,
        neogit = false,
        neotree = false,
        treesitter = true,
        telescope = true,
      }
    })
    vim.api.nvim_command('colorscheme catppuccin-macchiato')
  end,
  as = 'catppuccin'
}

-- development
use { 'folke/neodev.nvim' }
use { 'romainl/vim-cool' }

-- stop word and nohl search
use { 'chaoren/vim-wordmotion' }
use { 'ggandor/leap.nvim' }

-- Surroundings
use {
  'tpope/vim-surround',
  requires = {
    'tpope/vim-repeat'
  }
}

use {
  'rest-nvim/rest.nvim',
  opt = true,
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('config.rest-nvim')
  end,
}

-- stay in end of file
require('language-specific')
