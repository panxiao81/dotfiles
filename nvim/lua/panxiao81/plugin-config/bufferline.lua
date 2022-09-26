vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
      -- Using lsp buildin nvim
      diagnostics = "nvim_lsp",
      -- offsets nvim-tree
      offsets = {{
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }}
    }
}
