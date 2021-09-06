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

require('telescope').load_extension('gh')

-- actions

local function live_grep_directory(prompt_bufnr)
  -- live grep within directory
  local content = action_state.get_selected_entry(prompt_bufnr)
  print('grep string in: ' .. content[1])
  actions._close(prompt_bufnr, true)
  require('telescope.builtin').live_grep({
    prompt_title = 'Find in - ' .. content[1],
    cwd = content[1],
  })
end

local M = {}

M.search_directories = function()
  print('cwd: ' .. vim.fn.getcwd())

  -- find * -type d
  local stdout, ret, stderr = utils.get_os_command_output({
    'find',
    vim.fn.getcwd(),
    '-type',
    'd'
  }, vim.fn.getcwd())

  pickers.new {
    results_title = 'Pick a directory',
    finder = finders.new_table {
      results = stdout,
    },
    sorter = sorters.get_fuzzy_file(),
    attach_mappings = function(_, map)
      map("i", "<cr>", live_grep_directory)
      map("n", "<cr>", live_grep_directory)
      return true
    end
  }:find()
end

return M
