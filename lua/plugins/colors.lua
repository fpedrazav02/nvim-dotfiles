local color_overrides = {
	light = {
		fg = "#000000",
		bg = "#ffffff",
		red = "#c82829",
		green = "#718c00",
		yellow = "#eab700",
		blue = "#4271ae",
		purple = "#8959a8",
		cyan = "#3e999f",
	},
	dark = {
		fg = "#eaeaea",
		bg = "#000000",
		red = "#d54e53",
		green = "#b9ca4a",
		yellow = "#e7c547",
		blue = "#7aa6da",
		purple = "#c397d8",
		cyan = "#70c0b1",
	},
}

return {
	"deparr/tairiki.nvim",
	lazy = false,
	priority = 1000,
	plugins = {
		blink = true,
		diffview = true,
		gitsigns = true,
		neovim = true,
		nvim_tree = true,
		semantic_tokens = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
	config = function()
		require("tairiki").setup()

		vim.cmd.colorscheme("tairiki")
	end,
}
