-- vim.cmd([[
--   set background=light
-- ]])

local colorscheme = "gruvbox"
-- local colorscheme = "quietlight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
