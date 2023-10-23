-- https://github.com/jonahgoldwastaken/copilot-status.nvim#example-with-lualine
copilot_status = require('config-copilot').get_status

require('lualine').setup {
  sections = {
    lualine_x = {
      copilot_status
    }
  }
}
