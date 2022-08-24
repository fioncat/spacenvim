return function()
	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
	})
	require("luasnip/loaders/from_vscode").load()
	require("luasnip/loaders/from_vscode").load({ paths = { "./snippets" } })
end
