local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')
local utils = require('telescope.utils')

require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--vimgrep',
      '--hidden',
    },
    layout_strategy = "vertical",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    path_display = { "absolute" },
    mappings = {
      n = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous
      },
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous
      },
    },
    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  }
}

local M = {}

-- live grep within current files directory
M.search_directories = function()
  local path = vim.fn.expand('%:h')
  local limitedPath = string.sub(path, -80)
  require('telescope.builtin').live_grep({
    prompt_title = 'Find in - ' .. limitedPath,
    cwd = path,
  })
end

return M
