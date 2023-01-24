-- Set test command for javascript to use local jest package
vim.cmd([[
  let test#javascript#jest#file_pattern = '\vtest?/.*\.(js|jsx|coffee)$'
  let test#javascript#jest#executable = 'npm run test'
]])

-- Set test command to run in terminal, not within neovim

vim.cmd([[let test#strategy = "dispatch"]])

-- Remove trailing white spaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

