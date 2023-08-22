-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end
--in here you can put the repo for different packages which can often be found on the github
return packer.startup(function(use)
  use("wbthomason/packer.nvim")
--implementing file explorer
  use("nvim-tree/nvim-tree.lua")
--statusline
  use("nvim-lualine/lualine.nvim")
--icons
  use("kyazdani42/nvim-web-devicons")
--current color scheme that has been implemented
  use('folke/tokyonight.nvim') -- test colour scheme
--plenary (used for telescope)
  use("nvim-lua/plenary.nvim")

--fuzzy finding
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

--autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")

--snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  --managing and installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  --configuring lsp servers
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp")
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })
  --below are unused / enhanced lsp uis
  --use("jose-elias-alvarez/typescript.nvim")
  use("onsails/lspkind.nvim")

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  --adding nvim colour for codes
  use("norcalli/nvim-colorizer.lua")
  --adding clipboard manager

  --adding nvim activtywatch plugin
  use("ActivityWatch/aw-watcher-vim")

   if packer_bootstrap then
    require("packer").sync()
  end
end)
