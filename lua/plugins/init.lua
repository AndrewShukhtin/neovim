local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local plug_url_format = ''
if vim.g.is_linux then
  plug_url_format = 'https://hub.fastgit.org/%s'
else
  plug_url_format = 'https://github.com/%s'
end

local packer_repo = string.format(plug_url_format, 'wbthomason/packer.nvim')
local install_cmd = string.format('10split |term git clone --depth=1 %s %s', packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  execute(install_cmd)
  execute 'packadd packer.nvim'
end

-- vim.cmd [[packadd packer.vim]]

return require('packer').startup(function()
  -- Packer сам себя 
  use 'wbthomason/packer.nvim'

  -- Устанавливаем тему и цвутовую схему
  use {
    'dracula/vim',
    config = function()
      vim.opt.termguicolors = true
      vim.cmd'colorscheme dracula'
    end
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'telescope'.setup {} end
  }

  use {
    'ms-jpq/chadtree', branch = 'chad',
    run = 'python3 -m chadtree deps',
  }

  use {
    'neovim/nvim-lspconfig'
  }
  
  use {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
      { 'onsails/lspkind-nvim' },
    }
  }
  
  use {
    'williamboman/nvim-lsp-installer'
  }

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use {
    'fatih/vim-go',
    config = function() vim.cmd([[let g:go_doc_keywordprg_enabled = 0]]) end
  }
  use {
  'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require'lualine'.setup {} end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require'nvim-treesitter.configs'.setup {
      ensure_installed = "maintained",
      highlight = {
        enable = true,
      }
    } end
  }


  -- ============================================
  -- ++++++++++++++++++ GIT +++++++++++++++++++++
  -- ============================================

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
    'nvim-lua/plenary.nvim'
    },
  }

  use {
    'tpope/vim-fugitive'
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- ==================================================================
  -- +++++++++++++++++++++++ EXPERIMENTAL +++++++++++++++++++++++++++++
  -- ==================================================================

  -- use {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons'
  -- }
  -- use {
  --   'romgrk/barbar.nvim',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use {
    'mhinz/vim-startify'
  }

  use {
    'tpope/vim-dadbod'
  }

  use {
    "akinsho/toggleterm.nvim",
  }
end)
