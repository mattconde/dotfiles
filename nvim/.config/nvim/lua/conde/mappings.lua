local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

keymap("n", "<space>", "", options)

-- use Esc less
keymap("i", "jk", "<esc>", options)

-- avoid unintentional switching to Ex mode
keymap("n", "Q", "", options)

-- correct Y behaviour to be similar to C / D
keymap("n", "Y", "y$", options)

-- change p behaviour to stop overwriting the unnamed & unnamedplus register
keymap("v", "p", 'p:let @+=@0<cr>:let @"=@0<cr>', options)

-- when using n/N keep result centered on screen
keymap("n", "n", "nzzzv", options)
keymap("n", "N", "Nzzzv", options)

-- disable search highlighting
keymap("n", "<leader>a", '<cmd>let @/ = ""<cr>', options)

-- change x behaviour so it pushes to the black hole register
keymap("n", "x", '"_x', options)
keymap("v", "x", '"_x', options)

-- toggle fern file tree
keymap("n", "<leader>e", "<cmd>:NvimTreeFindFileToggle<cr>", options)

-- quickfix lists
keymap("n", "<c-j>", "<cmd>cnext<cr>", options)
keymap("n", "<c-k>", "<cmd>cprev<cr>", options)
keymap("n", "<c-q>", "<cmd>copen<cr>", options)

-- navigate splits with arrow keys
keymap("n", "<left>", "<c-w>h", options)
keymap("n", "<down>", "<c-w>j", options)
keymap("n", "<up>", "<c-w>k", options)
keymap("n", "<right>", "<c-w>l", options)

-- create splits
keymap("n", "<s-left>", "<cmd>vsplit<cr>", options)
keymap("n", "<s-down>", "<cmd>split<cr>", options)
keymap("n", "<s-up>", "<cmd>split<cr>", options)
keymap("n", "<s-right>", "<cmd>vsplit<cr>", options)

-- stay selected whilst indenting
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

-- move selected lines
keymap("v", "J", ":m '>+1<cr>gv=gv", options)
keymap("v", "K", ":m '<-2<cr>gv=gv", options)

-- search word under cursor in buffer
keymap("n", "<c-s>", "/<c-r><c-w><cr>", options)

-- TELESCOPE
-- explore files
keymap("n", "<c-p>", [[<cmd>lua require('telescope.builtin').git_files()<cr>]], options)

-- live grep in project directory
keymap("n", "<c-e>", [[<cmd>lua require('conde.plugin-config.telescope').search_directories()<cr>]], options)

-- live grep text
keymap("n", "<c-g>", [[<cmd>lua require('telescope.builtin').live_grep { only_sort_text = true, search = '' }<cr>]], options)

-- grep text under cursor
keymap("n", "<c-f>", [[<cmd>lua require("telescope.builtin").grep_string { only_sort_text = true, search = vim.fn.expand("<cword>") }<cr>]], options)

-- git branches
keymap("n", "<leader>gb", [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], options)

-- git commits
keymap("n", "<leader>gc", [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], options)

-- git status
keymap("n", "<leader>gs", [[<cmd>lua require('telescope.builtin').git_status()<cr>]], options)

-- github pull requests
keymap("n", "<leader>gp", [[<cmd>lua require('telescope').extensions.gh.pull_request()<cr>]], options)

-- help tags
keymap("n", "<leader>h", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], options)

-- formatter.nvim format
keymap("n", "<leader>f", [[<cmd>Format<cr>]], options)

local M = {}

M.lsp_mappings = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", options)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", options)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", options)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
  buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", options)
  buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<cr>", options)
end

return M
