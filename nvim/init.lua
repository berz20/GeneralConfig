local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local undodir = ".config/nvim/undo"

local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePost",
	{ command = "source <afile> | PackerCompile", group = packer_group, pattern = "init.lua" }
)

require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- use "andweeb/presence.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }
	use "glepnir/dashboard-nvim"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
	use "jose-elias-alvarez/null-ls.nvim"
	-- use "kyazdani42/nvim-web-devicons"
	use "L3MON4D3/LuaSnip"
	use "lewis6991/gitsigns.nvim"
	use "neovim/nvim-lspconfig"
	use "nvim-lua/plenary.nvim"
	use "nvim-lualine/lualine.nvim"
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"
	use "ahmedkhalf/project.nvim"
	use "nvim-treesitter/nvim-treesitter"
	-- use "onsails/lspkind-nvim"
	-- use "ryanoasis/vim-devicons"
	use "saadparwaiz1/cmp_luasnip"
	use "tpope/vim-commentary"
	use "williamboman/nvim-lsp-installer"
	use "windwp/nvim-autopairs"
	use "vladdoster/remember.nvim"
	use "rafamadriz/friendly-snippets"
	use "mg979/vim-visual-multi"
	use "norcalli/nvim-colorizer.lua"
  use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
	use {
      'lervag/vimtex',
      opt = true,
      config = function ()
          vim.g.vimtex_view_method = 'zathura'
          vim.g.vimtex_view_general_viewer = 'zathura'
          vim.g.vimtex_compiler_latexmk_engines = {
              _ = '-xelatex'
          }
          vim.g.tex_comment_nospell = 1
          vim.g.vimtex_compiler_progname = 'nvr'
          vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
          vim.g.vimtex_view_general_options_latexmk = '--unique'
      end,
      ft = 'tex'
  }
end)

vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.mouse = "a";
vim.o.undodir = undodir
vim.o.undofile = true


vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- WINDOW 
vim.keymap.set("n", "<Leader>wk", "<C-w>k")
vim.keymap.set("n", "<Leader>wh", "<C-w>h")
vim.keymap.set("n", "<Leader>wj", "<C-w>j")
vim.keymap.set("n", "<Leader>wl", "<C-w>l")
vim.keymap.set("n", "<Leader>ww", "<C-w>w")
vim.keymap.set("n", "<Leader>we", "<C-w>v")
vim.keymap.set("n", "<Leader>ws", "<C-w>s")
vim.keymap.set("n", "<Leader>wx", "<C-w>c")

--BUFFER
vim.keymap.set("n", "<Leader>bj", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bk", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bx", ":bp<CR>:bd #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>/", ":let @/ = \"\"<CR>", { silent = true })
vim.keymap.set("n", "<Leader>y", ":%y<CR>")
vim.keymap.set("n", "k", "v:count == 0 ? \"gk\" : \"k\"", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? \"gj\" : \"j\"", { expr = true, silent = true })
vim.keymap.set("n", "<Leader>l", ":vsplit term://zsh <CR>", { silent = true })
vim.keymap.set("t", "<Leader><Esc>", "<C-\\><C-n>", { silent = true })
vim.keymap.set("n", "<Leader>0", ":wqall <CR>", { silent = true })
vim.keymap.set("n", "<Leader>cc", ":ColorizerToggle <CR>", { silent = true })
vim.keymap.set("n", "<Leader>v", ":edit ~/.config/nvim/init.lua<CR>", { silent = true }

)



local lang_maps = {
	cpp = { build = "g++ % -o %:r", exec = "./%:r" },
	sh = { exec = "./%" },
	go = { build = "go build", exec = "go run %" },
	rust = { exec = "cargo run" },
	arduino = {
		build = "arduino-cli compile --fqbn arduino:avr:uno %:r",
		exec = "arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:r",
	},
}
for lang, data in pairs(lang_maps) do
	if data.build ~= nil then
		vim.api.nvim_create_autocmd(
			"FileType",
			{ command = "nnoremap <Leader>b :!" .. data.build .. "<CR>", pattern = lang }
		)
	end
	vim.api.nvim_create_autocmd(
		"FileType",
		{ command = "nnoremap <Leader>e :split<CR>:ter " .. data.exec .. "<CR>", pattern = lang }
	)
end
vim.api.nvim_create_autocmd("BufWritePre", {
	command = "lua vim.lsp.buf.formatting_sync(nil, 1000)",
	pattern = "*.cpp,*.css,*.go,*.h,*.html,*.js,*.json,*.jsx,*.md,*.py,*.rs,*.ts,*.tsx,*.yaml,*.hs",
})
vim.api.nvim_create_autocmd("InsertEnter", { command = "set norelativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("InsertLeave", { command = "set relativenumber", pattern = "*" })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", pattern = "*" })
vim.api.nvim_create_autocmd("BufWinEnter", { command = "set noexpandtab tabstop=2 shiftwidth=2", pattern = "*.rs" })

vim.cmd "sign define DiagnosticSignError text=● texthl=DiagnosticSignError"
vim.cmd "sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn"
vim.cmd "sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo"
vim.cmd "sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint"

-- PLUGINs

-- require("presence"):setup {
-- 	neovim_image_text = "Neovim",
-- 	presence_log_level = "error",
-- 	presence_editing_text = "Editing « %s »",
-- 	presence_file_explorer_text = "Browsing files",
-- 	presence_reading_text = "Reading  « %s »",
-- 	presence_workspace_text = "Working on « %s »",
-- }
require('colorizer').setup{}
require('remember')
require("nvim-autopairs").setup{}
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

-- require("catppuccin").setup()

vim.cmd [[colorscheme catppuccin]]

local db = require "dashboard"
db.custom_header = {
	"",
	"",
	"",
	"",
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	"  ╚╝   ╚══╝  ╚═════╝  ╚════╝     ╚══╝    ╚╝  ╚╝      ╚╝",
	"",
	"",
	"",
}
--      
db.custom_center = {
	{
		icon = " ",
		desc = "New File            ",
		action = "DashboardNewFile",
		shortcut = "SPC o",
	},
	{
		icon = " ",
		desc = "Browse Projects     ",
		action = "Telescope projects",
		shortcut = "SPC p",
	},
	{
		icon = " ",
		desc = "Browse Files        ",
		action = "Telescope file_browser",
		shortcut = "SPC .",
	},
	{
		icon = " ",
		desc = "Old Files           ",
		action = "Telescope oldfiles",
		shortcut = "SPC -",
	},
	{
		icon = " ",
		desc = "Find File           ",
		action = "Telescope find_files",
		shortcut = "SPC f",
	},
	{
		icon = " ",
		desc = "Configure Neovim    ",
		action = "edit ~/.config/nvim/init.lua",
		shortcut = "SPC v",
	},
}
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })

local luasnip = require "luasnip"
local cmp = require "cmp"
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
}

local servers = {
	"bashls",
	"clangd",
	"cssls",
	-- "gopls",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	-- "hls",
}
-- local has_formatter = { "gopls", "rust_analyzer", "sumneko_lua", "tsserver" }
local has_formatter = { "rust_analyzer", "sumneko_lua", "tsserver" }
for _, name in pairs(servers) do
	local found, server = require("nvim-lsp-installer").get_server(name)
	if found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end
local setup_server = {
	sumneko_lua = function(opts)
		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
	end,
}
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "<Leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<Leader>i", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	if setup_server[server.name] then
		setup_server[server.name](opts)
	end
	server:setup(opts)
end)

local null_ls = require "null-ls"
null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
	},
}

require("gitsigns").setup {
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
}

local cp = require("catppuccin.palettes").get_palette()
local custom_catppuccin = require "lualine.themes.catppuccin"
custom_catppuccin.normal.b.bg = cp.surface0
custom_catppuccin.normal.c.bg = cp.base
custom_catppuccin.insert.b.bg = cp.surface0
custom_catppuccin.command.b.bg = cp.surface0
custom_catppuccin.visual.b.bg = cp.surface0
custom_catppuccin.replace.b.bg = cp.surface0
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.a.bg = cp.base
custom_catppuccin.inactive.b.bg = cp.base
custom_catppuccin.inactive.b.fg = cp.surface0
custom_catppuccin.inactive.c.bg = cp.base
require("lualine").setup {
	options = {
		theme = custom_catppuccin,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		-- lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_a = { { "mode", right_padding = 2 } },
		lualine_b = { "filename", "branch", { "diff", colored = false } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
		-- lualine_z = { { "location", left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				-- separator = { left = "", right = "" },
				separator = { right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
}
require("project_nvim").setup{}
local telescope = require "telescope"
telescope.setup {
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "insert",
		hidden = true,
		file_ignore_patterns = { ".git/", "node_modules/", "target/" },
	},
	extensions = { file_browser = { hidden = true } },
}
telescope.load_extension "file_browser"
vim.keymap.set("n", "<Leader>.", telescope.extensions.file_browser.file_browser)
telescope.load_extension "projects"
vim.keymap.set("n", "<Leader>p", telescope.extensions.projects.projects)
vim.keymap.set("n", "<Leader>,", require("telescope.builtin").buffers)
vim.keymap.set("n", "<Leader>-", require("telescope.builtin").oldfiles)
vim.keymap.set("n", "<Leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<Leader>t", require("telescope.builtin").treesitter)

require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"go",
		"html",
		"lua",
		"make",
		"python",
		"rust",
		"tsx",
		"typescript",
		"yaml",
		"haskell",
	},
	highlight = { enable = true },
}

vim.keymap.set({ "n", "v" }, "<Leader>c", ":Commentary<CR>", { silent = true })

