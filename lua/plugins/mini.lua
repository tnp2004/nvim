require("mini.ai").setup({})
require("mini.move").setup({})
require("mini.cursorword").setup({})
require("mini.surround").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.bufremove").setup({})
require("mini.bufremove").setup({})
require("mini.tabline").setup({})
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
require("mini.statusline").setup({
	content = {
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
			local location = function()
				if MiniStatusline.is_truncated(75) then
					return ""
				end
				return string.format("%d:%d", vim.fn.line("."), vim.fn.col("$") - 1)
			end
			local lsp = function()
				if MiniStatusline.is_truncated(75) then
					return ""
				end
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				if #clients == 0 then
					return ""
				end
				local seen = {}
				local names = {}
				for _, c in ipairs(clients) do
					local key = c.name:gsub("[-_]", "")
					if not seen[key] then
						seen[key] = true
						table.insert(names, c.name)
					end
				end
				return "󰰎 " .. table.concat(names, ", ")
			end
			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics, lsp() } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location() } },
			})
		end,
	},
})
