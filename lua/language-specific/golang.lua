local packer = require('packer')
local lspconfig = require('lspconfig')

packer.use {
  'crispgm/nvim-go',
  requires = {
    'nvim-lua/plenary.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    local golang = require('go')

    golang.setup({
      notify = true,
    })

    golang.config.update_tool('quicktype', function(tool)
      tool.pkg_mgr = 'yarn'
    end)
  end
}

require('lspconfig').gopls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
