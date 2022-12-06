local fn = vim.fn

-- Installing the packer
local plug_url_format = ""
if vim.g.is_linux then
  plug_url_format = 'https://hub.fastgit.org/%s'
else
  plug_url_format = 'https://github.com/%s'
end

vim.g.package_home = fn.stdpath('data') .. '/site/pack/packer/'
local packer_install_dir = vim.g.package_home .. '/opt/packer.nvim'

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_install_dir) == "" then
  vim.api.nvim_echo({ { 'Installing packer.nvim', 'Type' } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init({
  disable_comments = true,
  display = {
    open_fn = function()
      local result, win, buf = require('packer.util').float {
        border = {
          { '╭', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╮', 'FloatBorder' },
          { '│', 'FloatBorder' },
          { '╯', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╰', 'FloatBorder' },
          { '│', 'FloatBorder' },
        },
      }
      vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
      return result, win, buf
    end
  }
})
