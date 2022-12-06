local servers = { 'cssls', 'elixirls', 'eslint', 'golangci_lint_ls', 'html', 'sumneko_lua' }

require('mason-lspconfig').setup({
  ensure_installed = servers,
  automatic_installation = true
})

