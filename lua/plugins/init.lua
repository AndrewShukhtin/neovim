local execute = vim.api.nvim_command
local fn = vim.fn

local packer_install_dir = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local plug_url_format = ""
if vim.g.is_linux then
  plug_url_format = "https://hub.fastgit.org/%s"
else
  plug_url_format = "https://github.com/%s"
end

local packer_repo = string.format(plug_url_format, "wbthomason/packer.nvim")
local install_cmd = string.format("10split |term git clone --depth=1 %s %s", packer_repo, packer_install_dir)

if fn.empty(fn.glob(packer_install_dir)) > 0 then
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  execute(install_cmd)
  execute("packadd packer.nvim")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  -- Packer it self
  use({ "wbthomason/packer.nvim" })

  use({
    "ray-x/starry.nvim",
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  })

  -- Advance syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('treesitter-config')"
  })
  use({ "p00f/nvim-ts-rainbow" })

  -- Brackets behavior
  use({
    "windwp/nvim-autopairs",
    config = "require('autopairs-config')"
  })

  -- Show keybindings
  use({
    "folke/which-key.nvim",
    config = "require('whichkey-config')"
  })

  -- Telescope for fuzzy finding
  use({
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = "require('telescope-config')"
  })

  -- Statusline
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = "require('lualine-config')",
  })

  -- Bufferlines
  use({
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('bufferline-config')",
  })

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout
  use({ "moll/vim-bbye" })

  -- File tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = "require('nvimtree-config')",
  })

  -- LSP and autocomplete support
  use({
    "neovim/nvim-lspconfig",
    config = "require('lsp')"
  })
  use({ "williamboman/nvim-lsp-installer" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-vsnip" })
  use({ "hrsh7th/vim-vsnip" })
  use({ "onsails/lspkind-nvim" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "rafamadriz/friendly-snippets" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "ray-x/lsp_signature.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })

  -- Git
  use({
    "lewis6991/gitsigns.nvim",
    config = "require('gitsigns-config')"
  })
  use({
    "f-person/git-blame.nvim",
    config = "require('gitblame-config')"
  })

  use({
    "goolord/alpha-nvim",
    config = "require('dashboard-config')"
  })

  -- Smart way indentetion
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = "require('blankline-config')"
  })

  -- Smart comments
  use({
    "terrortylor/nvim-comment",
    config = "require('comment-config')"
  })

  use({
    "akinsho/toggleterm.nvim",
    config = "require('toggleterm-config')"
  })

  -- NOTE: unused plugin
  -- use {
  --   'filipdutescu/renamer.nvim',
  --   branch = 'master',
  --   requires = { {'nvim-lua/plenary.nvim'} },
  --   config = "require('renamer-config')"
  -- }

  use({
    "tami5/lspsaga.nvim",
    branch = "nvim6.0",
    config = "require('lspsaga-config')"
  })

  -- NOTE: unstable plugin :(
  -- use({
  -- 	"iamcco/markdown-preview.nvim",
  -- 	run = "cd app && npm install",
  -- 	ft = "markdown",
  -- })
  --

  -- For go-dap
  use 'ray-x/guihua.lua' -- recommanded if need floating window support
  use({ 'mfussenegger/nvim-dap' })
  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = "require('dapui-config')",
  })

  use({
    'ray-x/go.nvim',
    branch = "nvim_0_7",
    config = "require('go-config')"
  })

  -- =================================================================================
  -- TODO: check this plugins
  -- =================================================================================

  -- A search panel for neovim.
  -- Spectre find the enemy and replace them with dark power
  -- use {"windwp/nvim-spectre"}
  --
  -- use {"rcarriga/nvim-notify"}
  --
  -- use {"ray-x/lsp_signature.nvim"} -- signature help plugin
end)
