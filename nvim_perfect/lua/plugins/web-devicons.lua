local colors = {
  none = "NONE",
  bg_dark = "#1f2335",
  bg = "#24283b",
  bg_highlight = "#292e42",
  terminal_black = "#414868",
  fg = "#c0caf5",
  fg_dark = "#a9b1d6",
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#565f89",
  dark5 = "#737aa2",
  blue0 = "#3d59a1",
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  blue1 = "#2ac3de",
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#B4F9F8",
  blue7 = "#394b70",
  magenta = "#bb9af7",
  magenta2 = "#ff007c",
  purple = "#9d7cd8",
  orange = "#ff9e64",
  yellow = "#e0af68",
  green = "#9ece6a",
  green1 = "#73daca",
  green2 = "#41a6b5",
  teal = "#1abc9c",
  red = "#f7768e",
  red1 = "#db4b4b",
  git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
  gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
}

require("nvim-web-devicons").set_icon {
  zsh = {
    icon = "",
    color = colors.green,
    cterm_color = "65",
    name = "Zsh"
  },
  tex = {
    icon = "",
    color = colors.teal,
    cterm_color = "65",
    name = "Latex"
  },
  cpp = {
    icon = "",
    color = colors.magenta,
    cterm_color = "65",
    name = "Cpp"
  },
  hs = {
    icon = "",
    color = colors.magenta2 ,
    cterm_color = "65",
    name = "Haskell"
  },
  py = {
    icon = "",
    color = colors.orange ,
    cterm_color = "65",
    name = "Python"
  },
  txt = {
    icon = "",
    color = colors.green1 ,
    cterm_color = "65",
    name = "Text"
  },
  lua = {
    icon = "",
    color = colors.blue ,
    cterm_color = "65",
    name = "Lua"
  },
  sh = {
    icon = "",
    color = colors.green ,
    cterm_color = "65",
    name = "Bash"
  },
  csv = {
    icon = "",
    color = colors.blue6 ,
    cterm_color = "65",
    name = "Csv"
  },
  ini = {
    icon = "",
    color = colors.yellow,
    cterm_color = "65",
    name = "Initial"
  },
  pdf = {
    icon = "",
    color = colors.red,
    cterm_color = "65",
    name = "Pdf"
  }


}
require("nvim-web-devicons").set_default_icon('', colors.fg)

