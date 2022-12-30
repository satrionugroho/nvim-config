require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'elixir', 'ruby', 'javascript', 'eex', 'css', 'erlang', 'heex', 'html', 'sql', 'tsx', 'vim', 'yaml', 'org' },
  auto_install = true,
  autotag = {
    enable = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'tsx', 'jsx',
      'markdown', 'org',
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
    enable = true,
    disable = { 'org' },
    additional_vim_regex_highlighting = { 'org' }
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
