require("ibl").setup{
  debounce = 100,
  scope = {
    show_start = true,
    show_end = false
  },
  exclude = { filetypes = {"help", "terminal" } }
}
