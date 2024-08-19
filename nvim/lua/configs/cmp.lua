
local status, cmp = pcall(require, "cmp")
if not status then
    return
end

local icons = {
	--Text = "󰙩",
	--Variable = "󰫧",
	--Snippet = "",
	--Constructor = "",
	--Function = "󰡱",
	--Keyword = "",
	--Module = "",
	--Method = "",
	--Class = "",
	--Struct = "",
	--Interface = "",
	--File = ""

  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = " ",
  EnumMember = " ",
  Field = "󰄶 ",
  File = " ",
  Folder = " ",
  Function = "󰡱 ",
  Interface = "󰜰",
  Keyword = "󰌆 ",
  Method = "ƒ ",
  Module = "󰏗 ",
  Property = " ",
  Snippet = "󰘍 ",
  Struct = " ",
  Text = "󰙩 ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = "󰫧 ",
}

cmp.setup({
	experimental = {
        ghost_text = true,
        border = function()
            local border_chars = {}
            local border_highlight = 'Blue'

            -- Top border
            table.insert(border_chars, {'╭', border_highlight})
            table.insert(border_chars, {'─', border_highlight})
            table.insert(border_chars, {'─', border_highlight})
            table.insert(border_chars, {'╮', border_highlight})

            -- Middle border
            table.insert(border_chars, {'│', border_highlight})
            table.insert(border_chars, {' ', 'Normal'})
            table.insert(border_chars, {' ', 'Normal'})
            table.insert(border_chars, {'│', border_highlight})

            -- Bottom border
            table.insert(border_chars, {'╰', border_highlight})
            table.insert(border_chars, {'─', border_highlight})
            table.insert(border_chars, {'─', border_highlight})
            table.insert(border_chars, {'╯', border_highlight})

            return border_chars
		end
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
	window = {
--		completion = cmp.config.window.bordered({ border = "double" }),
		completion = {
--border = { "╭", "", "╮", "│", "╯", "", "╰", "│" },
			border = "rounded",
			scrollbar = false,
			winhighlight = "Normal:None,FloatBorder:Blue,CursorLine:IncSearch,Search:None",
			padding = 2
		},
		documentation = {
			border = "single",

			winhighlight = "Normal:None,FloatBorder:Label,CursorLine:IncSearch,Search:None",
		}
	},
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
	{ name = "path" },
	{name = "cmdline"},
    }),
	 formatting = {
	fields = {"kind", "abbr", "menu"},
		format = function(_, vim_item)
			local kind = vim_item.kind
			vim_item.kind = (icons[kind] or "Foo") .. "  "
			vim_item.menu = " (".. kind ..") "
			vim_item.abbr = string.sub(vim_item.abbr, 0, 30)
			return vim_item
		end,
        -- Other formatting options...
    },

})

