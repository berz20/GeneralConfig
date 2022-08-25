local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local packer_bootstrap = nil
local g = vim.g

-- if fn.empty(fn.glob(install_path)) > 0 then
--   packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
--     install_path })
-- end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Needed to load first
    use { 'lewis6991/impatient.nvim' }
    use { 'nathom/filetype.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons', config = "require('plugins.web-devicons')"  }
    use { 'goolord/alpha-nvim', config = "require('plugins.alpha')" }
    -- use {
    --     'goolord/alpha-nvim',
    --     requires = { 'kyazdani42/nvim-web-devicons' },
    --     config = function ()
    --         require'alpha'.setup(require'alpha.themes.startify'.config)
    --     end
    -- }
    use { 'nvim-lualine/lualine.nvim', config = "require('plugins.lualine')" }
    -- use { 'tamton-aquib/staline.nvim', config = "require('plugins.staline')" }

    -- Themes
    use { 'catppuccin/nvim', as = "catppuccin" }
    -- use { 'navarasu/onedark.nvim' }

    -- Latex
    use { 'lervag/vimtex' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', config = "require('plugins.treesitter')" }
    use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } }
    use { 'RRethy/nvim-treesitter-textsubjects', after = { 'nvim-treesitter' } }
    use { 'm-demare/hlargs.nvim', config = function() require('hlargs').setup() end }

    -- Navigating (Telescope/Tree/Refactor)
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	  use { 'nvim-telescope/telescope-file-browser.nvim'}
    use { 'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim'}
      }
    }
    use { 'cljoly/telescope-repo.nvim' }
    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
    -- use { 'nvim-pack/nvim-spectre' }
    use { 'kyazdani42/nvim-tree.lua', config = "require('plugins.tree')" }
    use { 'gbprod/stay-in-place.nvim',
      config = function()
        require('stay-in-place').setup({})
      end
    }

    -- LSP Base
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }
    use { 'neovim/nvim-lspconfig' }

    -- LSP Cmp
    use { 'hrsh7th/nvim-cmp', event = 'InsertEnter', config = "require('plugins.cmp')" }
    use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'cmp-nvim-lua' }
    use { 'hrsh7th/cmp-buffer', after = 'cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-path', after = 'cmp-buffer' }
    use { 'hrsh7th/cmp-cmdline', after = 'cmp-path' }
    use { 'hrsh7th/cmp-calc', after = 'cmp-cmdline' }
    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp', after = 'cmp-calc' }
    use { 'David-Kunz/cmp-npm', after = 'cmp-tabnine', requires = 'nvim-lua/plenary.nvim',
      config = "require('plugins.cmp-npm')" }
    use { 'saadparwaiz1/cmp_luasnip', after = 'cmp-npm' }

    -- LSP Addons
    use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }
    use { 'onsails/lspkind-nvim' }
    use { 'folke/lsp-trouble.nvim', config = "require('plugins.trouble')" }
    use { 'nvim-lua/popup.nvim' }
    -- use { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', config = "require('plugins.gps')", after = 'nvim-treesitter' }
    use { 'jose-elias-alvarez/typescript.nvim' }

    -- General
    -- use { 'AndrewRadev/switch.vim' }
    -- use { 'AndrewRadev/splitjoin.vim' }
    use { 'numToStr/Comment.nvim', config = "require('plugins.comment')" }
    -- use { 'LudoPinelli/comment-box.nvim' }
    use { 'akinsho/nvim-toggleterm.lua', branch = 'main', config = "require('plugins.toggleterm')" }
    -- use { 'tpope/vim-repeat' }
    -- use { 'tpope/vim-speeddating' }
    -- use { 'dhruvasagar/vim-table-mode' }
    use { 'mg979/vim-visual-multi' }
    use { 'junegunn/vim-easy-align' }
    -- use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
    -- use { 'nacro90/numb.nvim', config = "require('plugins.numb')" }
    -- use { 'folke/todo-comments.nvim', config = "require('plugins.todo-comments')" }
    -- use { 'folke/zen-mode.nvim', config = "require('plugins.zen')", disable = not EcoVim.plugins.zen.enabled }
    -- use { 'folke/twilight.nvim', config = function() require("twilight").setup {} end }
    -- use { 'ggandor/lightspeed.nvim' }
    -- use { 'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter" }
    -- use { 'romgrk/barbar.nvim', branch = 'feat/wipeout-cmds', requires = { 'kyazdani42/nvim-web-devicons' },
      -- config = "require('plugins.barbar')" }
    -- use { 'rcarriga/nvim-notify' }
    use { 'vuki656/package-info.nvim', event = "BufEnter package.json", config = "require('plugins.package-info')" }
    -- use { 'iamcco/markdown-preview.nvim', run = "cd app && npm install",
      -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } }
    -- use { 'declancm/cinnamon.nvim', config = "require('plugins.cinnamon')" }
    use { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end }
    use { 'Shatur/neovim-session-manager', config = "require('plugins.session-manager')" }
    use { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end }
    -- use { 'sunjon/shade.nvim', config = function() require("shade").setup(); require("shade").toggle(); end }

    -- Snippets & Language & Syntax
    use { 'windwp/nvim-autopairs', after = { 'nvim-treesitter', 'nvim-cmp' }, config = "require('plugins.autopairs')" }
    -- use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
    use { 'NvChad/nvim-colorizer.lua', config = "require('plugins.colorizer')" }
    use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' }

    -- Git
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = "require('plugins.git.signs')",
      event = "BufRead"
    }
    use { 'sindrets/diffview.nvim', config = "require('plugins.git.diffview')" }
    use { 'akinsho/git-conflict.nvim', config = "require('plugins.git.conflict')" }
    use { 'ThePrimeagen/git-worktree.nvim', config = "require('plugins.git.worktree')" }
    use { 'kdheepak/lazygit.nvim' }

    -- -- Testing
    -- use {
    --   'rcarriga/neotest',
    --   requires = {
    --     'nvim-lua/plenary.nvim',
    --     'nvim-treesitter/nvim-treesitter',
    --     'haydenmeade/neotest-jest'
    --   },
    --   config = "require('plugins.neotest')"
    -- }
    --
    -- -- DAP
    -- use { 'theHamsta/nvim-dap-virtual-text' }
    -- use { 'rcarriga/nvim-dap-ui' }
    -- use { 'mfussenegger/nvim-dap', config = "require('plugins.dap')" }

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    compile_path = compile_path,
    disable_commands = true,
    max_jobs = 50,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
})
-- disable_plugins = {
--   -- NOTE: These two plugins are for better performance
--   -- and fixing one of neovim bugs.
--   impatient = false,
--
--   -- NOTE: Many plugins use this plugin as a dependency.
--   -- I suggest to not remove this plugins.
--   plenary = false,
--
--   -- NOTE: These plugins are colorscheme. By default only
--   -- enfocado is enabled. you can enable other by changing
--   -- true to false.
--   catppuccin = false,
--
--   -- NOTE: These plugins are for debugging. You can install
--   -- Some debug servers with dap_install but the list of those
--   -- Are realy small. You can install debugger by your self and
--   -- then configure it by your self so you can use nvim_dap and nvim_dap_ui
--   -- without dap_install
--   -- nvim_dap = true,
--   -- dap_install = true,
--   -- nvim_dap_ui = true,
--
--   -- NOTE: these plugins are telescope and telescope extensions. fzf is for
--   -- better searching experince and you can fuzzy find directories with
--   -- telescope_find_directories
--   telescope_fzf_native = false,
--   telescope_file_browser = false,
--   telescope = false,
--
--
--   -- NOTE: nvim-cmp and luasnip are for code completion.
--   nvim_cmp = false,
--   luasnip = false,
--   friendly_snippets = false,
--   cmp_buffer = false,
--   cmp_path = false,
--   cmp_cmdline = false,
--   cmp_nvim_lsp = false,
--   cmp_luasnip = false,
--   cmp_nvim_lua = false,
--   cmp_tabnine = false,
--   cmp_npm = false,
--
--   nvim_web_devicons = false,
--   lualine = false,
--
--   truezen = false,
--   nvim_tree = false,
--   treesitter = false,
--   nvim_colorizer = false,
--   alpha = false,
--   nvim_lspconfig = false,
--   lsp_installer = false,
--   null_ls = false,
--   lspsaga = false,
--   symbols_outline = false,
--   lsp_signature = false,
--   toggleterm = false,
--   fugitive = false,
--   gitsigns = false,
--   autopairs = false,
--   nvim_ts_autotag = false,
--   todo_comments = false,
--   which_key = false,
--   mkdir = false,
--   kommentary = false,
--   ts_context_commentstring = false,
--   vim_matchup = false,
--   vim_resize = false,
-- }
-- return packer.startup({
--   function(use)
--     -- Packer can manage itself
--     use 'wbthomason/packer.nvim'
--
--     -- Needed to load first
--     use {
--       'lewis6991/impatient.nvim',
--       disable = disable_plugins.impatient,
--     }
--     use {
--       'nathom/filetype.nvim',
--       event = { "BufRead", "BufNewFile" },
--       disable = disable_plugins.plenary,
--
--     }
--     use {
--       'nvim-lua/plenary.nvim',
--       disable = disable_plugins.plenary,
--     }
--     use {
--       'kyazdani42/nvim-web-devicons',
--       event = { "BufRead", "BufNewFile" },
--       config = "require('plugins.web-devicons')",
--       disable = disable_plugins.nvim_web_devicons,
--     }
--     use {
--       'goolord/alpha-nvim',
--       -- cmd = "Alpha",
--       config = function()
--         require("plugins.alpha")
--       end,
--       -- disable = disable_plugins.alpha,
--     }
--     -- use {
--     --     'goolord/alpha-nvim',
--     --     requires = { 'kyazdani42/nvim-web-devicons' },
--     --     config = function ()
--     --         require'alpha'.setup(require'alpha.themes.startify'.config)
--     --     end
--     -- }
--     use {
--       'nvim-lualine/lualine.nvim',
--       config = "require('plugins.lualine')",
--       -- event = { "BufRead", "BufNewFile" },
--       -- disable = disable_plugins.lualine,
--     }
--     -- use { 'tamton-aquib/staline.nvim', config = "require('plugins.staline')" }
--
--     -- Themes
--     use {
--       'catppuccin/nvim',
--       as = "catppuccin",
--       disable = disable_plugins.catppuccin,
--     }
--     -- use { 'navarasu/onedark.nvim' }
--
--     -- Latex
--     use {
--       'lervag/vimtex',
--       -- event = { "BufRead", "BufNewFile" },
--       -- disable = disable_plugins.vimtex,
--     }
--
--     -- Treesitter
--     use {
--       "nvim-treesitter/nvim-treesitter",
--       run = ":TSUpdate",
--       event = { "BufRead", "BufNewFile" },
--       cmd = {
--         "TSInstall",
--         "TSInstallInfo",
--         "TSInstallSync",
--         "TSUninstall",
--         "TSUpdate",
--         "TSUpdateSync",
--         "TSDisableAll",
--         "TSEnableAll",
--       },
--       config = function()
--         require("plugins/treesitter")
--       end,
--       disable = disable_plugins.treesitter,
--     }
--     use {
--       'nvim-treesitter/nvim-treesitter-textobjects',
--       after = { 'nvim-treesitter' },
--       disable = disable_plugins.treesitter_textobjects,
--     }
--     use {
--       'RRethy/nvim-treesitter-textsubjects',
--       after = { 'nvim-treesitter' },
--       disable = disable_plugins.treesitter_textsubjects,
--     }
--     use {
--       'm-demare/hlargs.nvim',
--       after = 'nvim-treesitter',
--       config =
--         function()
--           require('hlargs').setup()
--         end,
--       disable =  disable_plugins.hlargs,
--     }
--
--     -- Navigating (Telescope/Tree/Refactor)
--     use {
--       'nvim-telescope/telescope-fzf-native.nvim',
--       run = 'make',
--       -- cmd = "Telescope",
--       -- disable = disable_plugins.telescope_fzf_native,
--     }
-- 	  use {
--       'nvim-telescope/telescope-file-browser.nvim',
--       -- after = 'telescope_fzf_native',
--       -- disable = disable_plugins.telescope_file_browser,
--     }
--     use {
--       'nvim-telescope/telescope.nvim',
--       config = "require('plugins.telescope')",
--       requires = {
--         { 'nvim-lua/popup.nvim' },
--         { 'nvim-lua/plenary.nvim' },
--         { 'nvim-telescope/telescope-fzf-native.nvim' },
--         { 'nvim-telescope/telescope-file-browser.nvim'}
--       }
--     }
--     use { 'cljoly/telescope-repo.nvim' }
--     use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
--     -- use { 'nvim-pack/nvim-spectre' }
--     use {
--       'kyazdani42/nvim-tree.lua',
--       config = "require('plugins.tree')",
--       cmd = {
--         "NvimTreeOpen",
--         "NvimTreeFocus",
--         "NvimTreeToggle",
--       },
--       disable = disable_plugins.nvim_tree,
--     }
--     use { 'gbprod/stay-in-place.nvim',
--       config = function()
--         require('stay-in-place').setup({})
--       end
--     }
--
--     -- LSP Base
--     use { 'williamboman/mason.nvim' }
--     use { 'williamboman/mason-lspconfig.nvim' }
--     use {
--       "neovim/nvim-lspconfig",
--     }
--     use {
--       "rafamadriz/friendly-snippets",
--       event = "InsertEnter",
--       disable = disable_plugins.friendly_snippets,
--     }
--     use {
--       "L3MON4D3/LuaSnip",
--       after = "friendly-snippets",
--       config = function()
--         require("luasnip.loaders.from_vscode").load()
--         require("luasnip.loaders.from_snipmate").lazy_load()
--       end,
--       disable = disable_plugins.luasnip,
--     }
--     -- LSP Cmp
--     use {
--       'hrsh7th/nvim-cmp',
--       event = 'InsertEnter',
--       config = "require('plugins.cmp')",
--       disable = disable_plugins.nvim_cmp,
--     }
--     use {
--       'hrsh7th/cmp-nvim-lua',
--       ft = "lua",
--       disable = disable_plugins.cmp_nvim_lua,
--     }
--     use {
--       'hrsh7th/cmp-nvim-lsp',
--       -- after = 'nvim_cmp',
--       -- disable = disable_plugins.cmp_nvim_lsp,
--     }
--     use {
--       'hrsh7th/cmp-buffer',
--       after = "nvim-cmp",
--       disable = disable_plugins.cmp_buffer,
--     }
--     use {
--       'hrsh7th/cmp-path',
--       after = "nvim-cmp",
--       disable = disable_plugins.cmp_path,
--     }
--     use {
--       'hrsh7th/cmp-cmdline',
--       after = "nvim-cmp",
--       disable = disable_plugins.cmp_cmdline,
--     }
--     use {
--       'hrsh7th/cmp-calc',
--       after = 'cmp-cmdline',
--       disable = disable_plugins.cmp_calc,
--     }
--     use {
--       'tzachar/cmp-tabnine',
--       run = './install.sh',
--       requires = 'hrsh7th/nvim-cmp',
--       after = 'cmp-calc',
--       disable = disable_plugins.cmp_tabnine,
--     }
--     use {
--       'David-Kunz/cmp-npm',
--       after = 'cmp-tabnine',
--       requires = 'nvim-lua/plenary.nvim',
--       config = "require('plugins.cmp-npm')",
--       disable = disable_plugins.cmp_npm,
--     }
--     use {
--       'saadparwaiz1/cmp_luasnip',
--       after = "LuaSnip",
--       disable = disable_plugins.cmp_luasnip,
--     }
--
--     -- LSP Addons
--     use { 'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')" }
--     use { 'onsails/lspkind-nvim' }
--     use { 'folke/lsp-trouble.nvim', config = "require('plugins.trouble')" }
--     use { 'nvim-lua/popup.nvim' }
--     -- use { 'ChristianChiarulli/nvim-gps', branch = 'text_hl', config = "require('plugins.gps')", after = 'nvim-treesitter' }
--     use { 'jose-elias-alvarez/typescript.nvim' }
--
--     -- General
--     -- use { 'AndrewRadev/switch.vim' }
--     -- use { 'AndrewRadev/splitjoin.vim' }
--     use { 'numToStr/Comment.nvim', config = "require('plugins.comment')" }
--     -- use { 'LudoPinelli/comment-box.nvim' }
--     use {
--       'akinsho/nvim-toggleterm.lua',
--       branch = 'main',
--       config = "require('plugins.toggleterm')",
--       cmd = { "Toggleterm" },
--       disable = disable_plugins.toggleterm,
--     }
--     -- use { 'tpope/vim-repeat' }
--     -- use { 'tpope/vim-speeddating' }
--     -- use { 'dhruvasagar/vim-table-mode' }
--     use { 'mg979/vim-visual-multi' }
--     use { 'junegunn/vim-easy-align' }
--     -- use { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' }
--     -- use { 'nacro90/numb.nvim', config = "require('plugins.numb')" }
--     -- use { 'folke/todo-comments.nvim', config = "require('plugins.todo-comments')" }
--     -- use { 'folke/zen-mode.nvim', config = "require('plugins.zen')", disable = not EcoVim.plugins.zen.enabled }
--     -- use { 'folke/twilight.nvim', config = function() require("twilight").setup {} end }
--     -- use { 'ggandor/lightspeed.nvim' }
--     -- use { 'folke/which-key.nvim', config = "require('plugins.which-key')", event = "BufWinEnter" }
--     -- use { 'romgrk/barbar.nvim', branch = 'feat/wipeout-cmds', requires = { 'kyazdani42/nvim-web-devicons' },
--       -- config = "require('plugins.barbar')" }
--     -- use { 'rcarriga/nvim-notify' }
--     use { 'vuki656/package-info.nvim', event = "BufEnter package.json", config = "require('plugins.package-info')" }
--     -- use { 'iamcco/markdown-preview.nvim', run = "cd app && npm install",
--       -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } }
--     -- use { 'declancm/cinnamon.nvim', config = "require('plugins.cinnamon')" }
--     use { 'airblade/vim-rooter', setup = function() vim.g.rooter_patterns = EcoVim.plugins.rooter.patterns end }
--     use { 'Shatur/neovim-session-manager', config = "require('plugins.session-manager')" }
--     use { 'kylechui/nvim-surround', config = function() require("nvim-surround").setup({}) end }
--     -- use { 'sunjon/shade.nvim', config = function() require("shade").setup(); require("shade").toggle(); end }
--
--     -- Snippets & Language & Syntax
--     use {
--       'windwp/nvim-autopairs',
--       keys = {
--         { "i", "(" },
--         { "i", "[" },
--         { "i", "{" },
--         { "i", "'" },
--         { "i", '"' },
--         { "i", '<' },
--         { "i", "<BS>" },
--       },
--       config = "require('plugins.autopairs')",
--       disable = disable_plugins.autopairs,
--     }
--     -- use { 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } }
--     use {
--       'NvChad/nvim-colorizer.lua',
--       event = { "BufRead", "BufNewFile" },
--       config = function()
--         require("plugins/colorizer")
--         vim.cmd("ColorizerAttachToBuffer")
--       end,
--       disable = disable_plugins.nvim_colorizer,
--     }
--
--     -- Git
--     use { 'lewis6991/gitsigns.nvim',
--       requires = { 'nvim-lua/plenary.nvim' },
--       event = { "BufRead", "BufNewFile" },
--       config = "require('plugins.git.signs')",
--       disable = disable_plugins.gitsigns,
--     }
--     use { 'sindrets/diffview.nvim', config = "require('plugins.git.diffview')" }
--     use { 'akinsho/git-conflict.nvim', config = "require('plugins.git.conflict')" }
--     use { 'ThePrimeagen/git-worktree.nvim', config = "require('plugins.git.worktree')" }
--     use { 'kdheepak/lazygit.nvim' }
--
--     -- -- Testing
--     -- use {
--     --   'rcarriga/neotest',
--     --   requires = {
--     --     'nvim-lua/plenary.nvim',
--     --     'nvim-treesitter/nvim-treesitter',
--     --     'haydenmeade/neotest-jest'
--     --   },
--     --   config = "require('plugins.neotest')"
--     -- }
--     --
--     -- -- DAP
--     -- use { 'theHamsta/nvim-dap-virtual-text' }
--     -- use { 'rcarriga/nvim-dap-ui' }
--     -- use { 'mfussenegger/nvim-dap', config = "require('plugins.dap')" }
--
--     if packer_bootstrap then
--       packer.sync()
--     end
--   end,
--   config = {
--     compile_path = compile_path,
--     disable_commands = true,
--     max_jobs = 50,
--     display = {
--       open_fn = function()
--         return require('packer.util').float({ border = 'rounded' })
--       end
--     }
--   }
-- })
--
