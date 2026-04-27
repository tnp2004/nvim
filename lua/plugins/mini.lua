require("mini.ai").setup({})
require("mini.move").setup({})
require("mini.cursorword").setup({})
require("mini.surround").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({})
require("mini.bufremove").setup({})
require("mini.tabline").setup({})
require("mini.statusline").setup({})
require("mini.diff").setup({})
require("mini.git").setup({})
require("mini.files").setup({
	mappings = {
		go_in_plus = "<CR>",
	},
})
require("mini.starter").setup({
	header = require("ascii").nvimghost,
	footer = "",
})
