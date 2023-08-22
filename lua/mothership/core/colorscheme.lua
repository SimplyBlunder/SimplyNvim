--vim.cmd("colorscheme palenightfall")
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")
if not status then
  print("colourscheme not found!")
  return
end
