require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'elixir', 'ruby', 'javascript', 'eex', 'css', 'erlang', 'heex', 'html', 'sql', 'tsx', 'vim', 'yaml' },
  auto_install = true,
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx',
      'markdown',
      'heex', 'leex', 'sface'
    }
  },
  context_commentstring = {
    enable = true,
    commentary_integration = {},
  },
  endwise = {
    enable = true,
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  textsubjects = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
    },
  }
})

vim.api.nvim_exec([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]], true)
