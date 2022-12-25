local M = {}

M.open_todo = function()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_option(buf, "modifiable", true)

  local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")

	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)

	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

  local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		border = "rounded",
	}

  win = vim.api.nvim_open_win(buf, false, opts)
  vim.api.nvim_set_current_win(win)
  vim.cmd.edit("~/vim-todo")
end

M.add_todo = function(text)
  vim.cmd(':silent !echo -[ ] ' .. text .. '>> ~/vim-todo')
end

return M
