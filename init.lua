require("mothership.plugins-setup")
require("mothership.core.options")
require("mothership.core.keymaps")
require("mothership.core.colorscheme")
require("mothership.plugins.nvim-tree")
require("mothership.plugins.lualine")
local async = require "plenary.async" -- used like this because telescope is dependant on it & other method didn't work.
require("mothership.plugins.telescope")
require("mothership.plugins.nvim-cmp")
