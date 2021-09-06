vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<space>", "", { noremap = true })

-- use Esc less
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

-- avoid unintentional switching to Ex mode
vim.api.nvim_set_keymap("n", "Q", "", { noremap = true })

-- correct Y behaviour to be similar to C / D
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- when using n/N keep result centered on screen
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

-- disable search highlighting
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>set nohlsearch<cr>", { noremap = true })

-- change x behaviour so it pushes to the black hole register
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true })

-- toggle fern file tree
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Fern . -drawer -reveal=% -toggle<cr>", { noremap = true })

-- navigate splits with arrow keys
vim.api.nvim_set_keymap("n", "<left>", "<c-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<up>", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<right>", "<c-w>l", { noremap = true })

-- create splits
vim.api.nvim_set_keymap("n", "<s-left>", "<cmd>vsplit<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<s-down>", "<cmd>split<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<s-up>", "<cmd>split<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<s-right>", "<cmd>vsplit<cr>", { noremap = true })

-- move selected lines
vim.api.nvim_set_keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true })

-- search word under cursor in buffer
vim.api.nvim_set_keymap("n", "<c-s>", "/<c-r><c-w><cr>", { noremap = true })

-- language server symbols
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>SymbolsOutline<cr>", { noremap = true })

-- lsp
vim.api.nvim_set_keymap("n", "ga", "<cmd>vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>vim.lsp.buf.definition()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gD", "<cmd>vim.lsp.buf.declaration()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>vim.lsp.buf.implementation()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>vim.lsp.buf.hover()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>vim.lsp.buf.signature_help()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>vim.lsp.buf.formatting()<cr>", { noremap = true, silent = true })

-- TELESCOPE
-- explore files
vim.api.nvim_set_keymap("n", "<c-p>", [[<cmd>lua require('telescope.builtin').git_files()<cr>]], { noremap = true })

-- live grep in project directory
vim.api.nvim_set_keymap("n", "<c-e>", [[<cmd>lua require('conde.plugin-config.telescope').search_directories()<cr>]], { noremap = true })

-- live grep text
vim.api.nvim_set_keymap("n", "<c-g>", [[<cmd>lua require('telescope.builtin').live_grep { only_sort_text = true, search = '' }<cr>]], { noremap = true })

-- grep text under cursor
vim.api.nvim_set_keymap("n", "<c-f>", [[<cmd>lua require("telescope.builtin").grep_string { only_sort_text = true, search = vim.fn.expand("<cword>") }<cr>]], { noremap = true })

-- git branches
vim.api.nvim_set_keymap("n", "<leader>gb", [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true })

-- git commits
vim.api.nvim_set_keymap("n", "<leader>gc", [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true })

-- git status
vim.api.nvim_set_keymap("n", "<leader>gs", [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true })

-- github pull requests
vim.api.nvim_set_keymap("n", "<leader>gp", [[<cmd>lua require('telescope').extensions.gh.pull_request()<cr>]], { noremap = true })

-- help tags
vim.api.nvim_set_keymap("n", "<leader>h", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], { noremap = true })

