local telescope = require('telescope')
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    layout_config = { anchor = 'N' },
    scroll_strategy = 'cycle',
    theme = require('telescope.themes').get_dropdown { layout_config = { prompt_position = 'top' } }
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown { layout_config = { prompt_position = 'top' } },
    },
    heading = { treesitter = true },
    file_browser = {
      hijack_netwrw = true,
      hidden = true,
      mappings = {
        i = {
          ['<c-n>'] = fb_actions.create,
          ['<c-r>'] = fb_actions.rename,
          ['<c-h>'] = fb_actions.toggle_hidden,
          ['<c-x>'] = fb_actions.remove,
          ['<c-p>'] = fb_actions.move,
          ['<c-y>'] = fb_actions.copy,
          ['<c-a>'] = fb_actions.select_all,
        }
      }
    },
    projects = {}
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
      previewer = true
    }
  }
}

telescope.load_extension 'ui-select'
telescope.load_extension 'notify'
telescope.load_extension 'file_browser'
telescope.load_extension 'projects'
