local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format("require(\"conde/plugin-config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

use 'wbthomason/packer.nvim'

-- language actions - nvim lsp
-- linting          - nvim lsp diagnosticls
-- auto formatting  - formatter.nvim

-- lsp
use {
  'neovim/nvim-lspconfig',
  config = get_config('lsp')
}

-- formatting
use {
  'mhartington/formatter.nvim',
  config = get_config('formatter')
}

-- treesitter
use {
  'nvim-treesitter/nvim-treesitter',
  config = get_config('nvim-treesitter'),
  run = ':TSUpdate'
}

-- treesitter - text objects
use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = get_config('nvim-treesitter'),
  requires = { 'nvim-treesitter/nvim-treesitter', opt = true }
}

-- theme
-- use { 'dracula/vim', as = 'dracula' }
use 'Mofiqul/dracula.nvim'

-- file explorer
use {
  'kyazdani42/nvim-tree.lua',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = get_config('nvim-tree')
}

-- git
use 'tpope/vim-fugitive'

-- statusline
use {
  'nvim-lualine/lualine.nvim',
  config = get_config('lualine'),
  event = 'VimEnter',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}

-- telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = get_config('telescope')
}

-- git signs
use {
  'lewis6991/gitsigns.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = get_config('gitsigns')
}

-- copilot
use { 'github/copilot.vim' }

-- auto-complete
use {
  'hrsh7th/nvim-cmp',
  requires = {
    { 'hrsh7th/cmp-copilot' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-emoji' },
    { 'f3fora/cmp-spell' }
  },
  config = get_config('nvim-cmp')
}

-- editorconfig support
use 'editorconfig/editorconfig-vim'

-- commenting out lines
use {
  'numToStr/Comment.nvim',
  config = get_config('comment')
}

-- highlight colors
use {
  'norcalli/nvim-colorizer.lua',
  event = 'BufReadPre',
  config = get_config('colorizer')
}

-- styled components
use 'styled-components/vim-styled-components'

-- graphql support
use 'jparise/vim-graphql'

