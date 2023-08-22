local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end


-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end



--installed LSPs / currently using / more : https://github.com/williamboman/mason-lspconfig.nvim
mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "cssls",
    "cmake",
  },

 -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    --"prettier", -- ts/js formatter //not being used
    "stylua", -- lua formatter
    --"eslint_d", -- ts/js linter // not being used
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})


