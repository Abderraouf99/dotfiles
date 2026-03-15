return {
	"nvim-flutter/flutter-tools.nvim",
	ft = { "dart" },
	cmd = {
		"FlutterRun",
		"FlutterReload",
		"FlutterRestart",
		"FlutterAttach",
		"FlutterDetach",
		"FlutterQuit",
		"FlutterDevices",
		"FlutterEmulators",
		"FlutterLogToggle",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("flutter-tools").setup({
			lsp = {
				capabilities = capabilities,
			},
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserFlutterKeymaps", { clear = true }),
			pattern = "dart",
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				vim.keymap.set(
					"n",
					"<leader>Fr",
					"<cmd>FlutterRun<CR>",
					vim.tbl_extend("force", opts, { desc = "Flutter run" })
				)
				vim.keymap.set(
					"n",
					"<leader>Fl",
					"<cmd>FlutterReload<CR>",
					vim.tbl_extend("force", opts, { desc = "Flutter hot reload" })
				)
				vim.keymap.set(
					"n",
					"<leader>FR",
					"<cmd>FlutterRestart<CR>",
					vim.tbl_extend("force", opts, { desc = "Flutter hot restart" })
				)
			end,
		})
	end,
}
