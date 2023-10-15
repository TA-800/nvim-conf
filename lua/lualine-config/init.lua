-- https://github.com/jonahgoldwastaken/copilot-status.nvim#example-with-lualine
copilot_status = require('copilot-status-config').get_status

require('lualine').setup {
  sections = {
    lualine_x = {
      copilot_status
    }
  }
}
