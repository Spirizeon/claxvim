-- Clax.nvim written by spirizeon (berzi), redxdager 
-- inspired by Josean Martinez
-- 2nd rewrite in lazy.nvim

-- keymaps
vim.g.mapleader = " " 
local keymap = vim.keymap 

keymap.set("i","jk","<ESC>", { desc = "Exit insert mode with jk" })
-- keymap.set("mode","keys","result", "descriptioon" )
keymap.set("n","<leader>pv",vim.cmd.Ex)
keymap.set("n","<leader>nt",vim.cmd.Neotree)
keymap.set("n","<leader>md",vim.cmd.MarkdownPreviewToggle) --only works on md files
keymap.set("n","<leader>cs","<cmd>Telescope colorscheme<cr>") -- added colorscheme keybind
keymap.set("n","<leader>ff","<cmd>Telescope find_files<cr>") -- find files
keymap.set("n","<leader>lg","<cmd>Telescope live_grep<cr>") -- find word
keymap.set("n","<leader>of","<cmd>Telescope oldfiles<cr>") -- recent files
keymap.set("n","<leader>nf","<cmd>new<cr>") -- new files


function open_terminal()
	vim.cmd("vsplit")
	vim.cmd("set nonumber")
	vim.cmd("cd %:p:h")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end

keymap.set("n","<leader>ot","<cmd>lua open_terminal()<cr>", { desc="open a vertical terminal with insert mode enabled, type SPACE + o + t"})

-- tab management (inspired by firefox)
keymap.set("n","<C-t>","<cmd>tabnew<cr>", { desc = "Open new tab" }) -- open new tab
keymap.set("n","<C-w>","<cmd>tabclose<cr>", { desc = "Close current tab" }) -- open new tab
keymap.set("n","<C-n>","<cmd>tabn<cr>", { desc = "Go to next tab" }) -- open new tab


-- options
vim.cmd('let g:netrw_liststyle = 3') -- for using tree listing style
local opt = vim.opt 

opt.relativenumber = true
opt.number = true

-- tabs and indent
opt.tabstop = 2
opt.shiftwidth = 2

opt.autoindent = true -- copy indent from current line into new one

-- search settings
opt.ignorecase = true -- ignore case
opt.smartcase = true -- mixed case allowed

opt.cursorline = true -- wtf is this 

opt.background = "dark" 
opt.termguicolors = true
opt.signcolumn = "yes" --show sign column so that text doesn't shift

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split controls
opt.splitright = true -- split vertically right
opt.splitbelow = true -- split horizontally to bottom

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "sql","ssh_config", "python","rust","css", "javascript", "html" },
          sync_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
	 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000,
		config = function()
			require"startup".setup({
					flavour = "auto", -- latte, frappe, macchiato, mocha
						background = { -- :h background
								light = "latte",
								dark = "mocha",
						},
						transparent_background = true, -- disables setting the background color.
						show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
						term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
						dim_inactive = {
								enabled = false, -- dims the background color of inactive window
								shade = "dark",
								percentage = 0.15, -- percentage of the shade to apply to the inactive window
						},
						no_italic = false, -- Force no italic
						no_bold = false, -- Force no bold
						no_underline = false, -- Force no underline
						styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
								comments = { "italic" }, -- Change the style of comments
								conditionals = { "italic" },
								loops = {},
								functions = {},
								keywords = {},
								strings = {},
								variables = {},
								numbers = {},
								booleans = {},
								properties = {},
								types = {},
								operators = {},
								-- miscs = {}, -- Uncomment to turn off hard-coded styles
						},
						color_overrides = {},
						custom_highlights = {},
						default_integrations = true,
						integrations = {
								cmp = true,
								gitsigns = true,
								nvimtree = true,
								treesitter = true,
								notify = false,
								mini = {
										enabled = true,
										indentscope_color = "",
								},
								-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
						},
				})
		end
	},
	{ "williamboman/mason.nvim" }, -- lsps
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

	{
		'nvim-lua/plenary.nvim',
	},
  {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup({theme="clax"})
  end
  },
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
	},

	{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
	},
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
	},


	
})

vim.cmd("colorscheme catppuccin") -- set default colorscheme
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE') -- set background transparent
