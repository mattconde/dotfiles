call plug#begin('~/.config/nvim/autoload/plugged')

" language actions - nvim lsp
" linting          - nvim lsp diagnosticls 
" auto formatting  - formatter.nvim

" lsp
Plug 'neovim/nvim-lspconfig'

" formatting
Plug 'mhartington/formatter.nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" theme
Plug 'dracula/vim', { 'as': 'dracula' }

" file explorer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" git
Plug 'tpope/vim-fugitive'

" custom start screen
Plug 'mhinz/vim-startify'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

" git signs - requires plenary
Plug 'lewis6991/gitsigns.nvim'

" snippets
Plug 'L3MON4D3/LuaSnip'

" auto-complete - sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-emoji'
Plug 'f3fora/cmp-spell'
Plug 'saadparwaiz1/cmp_luasnip'

" auto-complete
Plug 'hrsh7th/nvim-cmp'

" Visual LSP symbols
Plug 'simrat39/symbols-outline.nvim'

" editorconfig support
Plug 'editorconfig/editorconfig-vim'

" commenting out lines
Plug 'tpope/vim-commentary'

" statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" motion / jump
Plug 'phaazon/hop.nvim'

" highlight colors
Plug 'norcalli/nvim-colorizer.lua'

" styled components
Plug 'styled-components/vim-styled-components'

" graphql support
Plug 'jparise/vim-graphql'

call plug#end()

" automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

