vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

-- require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]
local color_palette = {
  a1 = "#8AADF4",
  a2 = "#8AADF4",
  a3 = "#8AADF4",
  a4 = "#8AADF4",
  a5 = "#8AB1EF",
  a6 = "#8AB6EB",
  a7 = "#8ABAE6",
  a8 = "#8ABFE1",
  a9 = "#8BC3DD",
  a10 = "#8BC8D8",
  a11 = "#8BCCD3",
  a12 = "#8BD1CF",
  a13 = "#8BD5CA",

}
vim.api.nvim_set_hl(0, '16', { fg = color_palette.a16 });
vim.api.nvim_set_hl(0, '15', { fg = color_palette.a15 });
vim.api.nvim_set_hl(0, '14', { fg = color_palette.a14 });
vim.api.nvim_set_hl(0, '13', { fg = color_palette.a13 });
vim.api.nvim_set_hl(0, '12', { fg = color_palette.a12 });
vim.api.nvim_set_hl(0, '11', { fg = color_palette.a11 });
vim.api.nvim_set_hl(0, '10', { fg = color_palette.a10 });
vim.api.nvim_set_hl(0, '9', { fg = color_palette.a9 });
vim.api.nvim_set_hl(0, '8', { fg = color_palette.a8 });
vim.api.nvim_set_hl(0, '7', { fg = color_palette.a7 });
vim.api.nvim_set_hl(0, '6', { fg = color_palette.a6 });
vim.api.nvim_set_hl(0, '5', { fg = color_palette.a5 });
vim.api.nvim_set_hl(0, '4', { fg = color_palette.a4 });
vim.api.nvim_set_hl(0, '3', { fg = color_palette.a3 });
vim.api.nvim_set_hl(0, '2', { fg = color_palette.a2 });
vim.api.nvim_set_hl(0, '1', { fg = color_palette.a1 });

