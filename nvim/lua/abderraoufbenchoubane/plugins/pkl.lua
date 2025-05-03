local function init()
	local treesitterExists, parsers = pcall(require, "nvim-treesitter.parsers")
	local _, installer = pcall(require, "nvim-treesitter.install")
	if treesitterExists then
		parsers.get_parser_configs().pkl = {
			install_info = {
				url = "https://github.com/apple/tree-sitter-pkl.git",
				revision = "0.17.0",
				files = { "src/parser.c", "src/scanner.c" },
				filetype = "pkl",
				used_by = { "pcf" },
			},
		}

		if not parsers.has_parser("pkl") then
			installer.update("pkl")
		end
	else
		print("[pkl-neovim] Required plugin 'tree-sitter/tree-sitter' not found.")
		print(
			"             Ensure that it is installed in order to receive features such as syntax highlighting and code folding."
		)
	end
end

return {
	"apple/pkl-neovim",
	lazy = true,
	ft = "pkl",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter",
			build = function(_)
				vim.cmd("TSUpdate")
			end,
		},
		"L3MON4D3/LuaSnip",
	},
	build = function()
		-- Set up syntax highlighting.
		vim.cmd("TSInstall! pkl")
	end,
	config = function()
		-- Set up snippets.
		init()
		require("luasnip.loaders.from_snipmate").lazy_load()
	end,
}
