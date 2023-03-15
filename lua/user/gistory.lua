local status_ok, gistory = pcall(require, "gistory")
if not status_ok then
  return
end

gistory.setup {
  default_branch = 'main',
}
