require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "thin",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "NvimTreeNormal",
        separator = false,
      },
    },
  }
})
