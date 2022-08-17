local keymap = vim.keymap.set
local silent = { silent = true }

-- Better window movement
keymap("n", "wk", "<C-w>k", silent)
keymap("n", "wh", "<C-w>h", silent)
keymap("n", "wj", "<C-w>j", silent)
keymap("n", "wl", "<C-w>l", silent)
keymap("n", "ww", "<C-w>w", silent)
keymap("n", "we", "<C-w>v", silent)
keymap("n", "ws", "<C-w>s", silent)
keymap("n", "wx", "<C-w>c", silent)
keymap("i", "<Leader>wk", "<C-w>k", silent)
keymap("i", "<Leader>wh", "<C-w>h", silent)
keymap("i", "<Leader>wj", "<C-w>j", silent)
keymap("i", "<Leader>wl", "<C-w>l", silent)
keymap("i", "<Leader>ww", "<C-w>w", silent)
keymap("i", "<Leader>we", "<C-w>v", silent)
keymap("i", "<Leader>ws", "<C-w>s", silent)
keymap("i", "<Leader>wx", "<C-w>c", silent)

keymap("i", "<C-k>", "<Up>", silent)
keymap("i", "<C-h>", "<Left>", silent)
keymap("i", "<C-j>", "<Down>", silent)
keymap("i", "<C-l>", "<Right>", silent)
-- Smart movement between lines
keymap("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true, silent = true })

-- H to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- Keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- Case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- Save file by CTRL-S
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- New File
keymap("n", "<Leader>n", ":ene <BAR> startinsert <CR>")
-- Telescope
local telescope = require "telescope"
-- require.load_extension "file_browser"
keymap("n", "f.", telescope.extensions.file_browser.file_browser)
keymap("n", "f,", require("telescope.builtin").buffers)
keymap("n", "f-", require("telescope.builtin").oldfiles)
keymap("n", "ff", require("telescope.builtin").find_files)
keymap("n", "fw", require("telescope.builtin").live_grep)
keymap("n", "fp", "<CMD>lua require('plugins.telescope').project_files()<CR>")
keymap("n", "<S-w>", "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>")

-- Remove highlights
keymap("n", "<Leader>0", ":noh<CR><CR>", silent)

-- Find word/file across project
keymap("n", "<Leader>pf", "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")
keymap("n", "<Leader>pw", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>")

-- Buffers
keymap("n", "bj", ":bp<CR>", silent)
keymap("n", "bk", ":bn<CR>", silent)
keymap("n", "bx", ":bp<CR>:bd #<CR>", silent)
keymap("i", "<Leader>bj", ":bp<CR>", silent)
keymap("i", "<Leader>bk", ":bn<CR>", silent)
keymap("i", "<Leader>bx", ":bp<CR>:bd #<CR>", silent)
keymap("n", "<Tab>", ":bn<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":bp<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":BufferClose<CR>", silent)

-- Move between barbar buffers
keymap("n", "<Space>1", ":BufferGoto 1<CR>", silent)
keymap("n", "<Space>2", ":BufferGoto 2<CR>", silent)
keymap("n", "<Space>3", ":BufferGoto 3<CR>", silent)
keymap("n", "<Space>4", ":BufferGoto 4<CR>", silent)
keymap("n", "<Space>5", ":BufferGoto 5<CR>", silent)
keymap("n", "<Space>6", ":BufferGoto 6<CR>", silent)
keymap("n", "<Space>7", ":BufferGoto 7<CR>", silent)
keymap("n", "<Space>8", ":BufferGoto 8<CR>", silent)
keymap("n", "<Space>9", ":BufferGoto 9<CR>", silent)
keymap("n", "<A-1>", ":BufferGoto 1<CR>", silent)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", silent)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", silent)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", silent)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", silent)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", silent)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", silent)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", silent)
keymap("n", "<A-9>", ":BufferGoto 9<CR>", silent)

-- Yank all frame
keymap("n", "<Leader>y", ":%y<CR>")

-- Don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- Avoid issues because of remapping <c-a> and <c-x> below
vim.cmd [[
  nnoremap <Plug>SpeedDatingFallbackUp <c-a>
  nnoremap <Plug>SpeedDatingFallbackDown <c-x>
]]

-- Quickfix
keymap("n", "<Space>,", ":cp<CR>", silent)
keymap("n", "<Space>.", ":cn<CR>", silent)

-- Toggle quicklist
keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- Easyalign
keymap("n", "ga", "<Plug>(EasyAlign)", silent)
keymap("x", "ga", "<Plug>(EasyAlign)", silent)

-- Manually invoke speeddating in case switch.vim didn't work
keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>", silent)

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  keymap("n", "bb", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
else
  keymap("n", "bb", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
end

-- -- Refactor with spectre
-- keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
-- keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- LSP
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent)
keymap("n", "<Leader>h", vim.lsp.buf.hover, silent)
keymap("n", "<Leader>i", vim.lsp.buf.definition, silent)
keymap("n", "<Leader>r", vim.lsp.buf.rename, silent)
-- keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", silent)
-- keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
-- keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
-- keymap("v", "<leader>cf", "<cmd>'<.'>lua vim.lsp.buf.range_formatting()<CR>", silent)
-- keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'rounded', max_width = 100 })<CR>", silent)
-- keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", silent)
-- keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
keymap("n", "<Leader>d", vim.diagnostic.open_float)
keymap("n", "g+", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)
keymap("n", "g-", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'rounded', max_width = 100 }})<CR>", silent)

-- Comment Box
-- keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
-- keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
