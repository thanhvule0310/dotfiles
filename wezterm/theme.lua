local wezterm = require("wezterm")

local Theme = {}

Theme.colors = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

function Theme.setup(config)
	local colors = Theme.colors

	config.colors = {
		split = colors.surface0,
		foreground = colors.text,
		background = colors.base,
		cursor_bg = colors.subtext0,
		cursor_border = colors.overlay2,
		cursor_fg = colors.base,
		selection_bg = colors.surface2,
		visual_bell = colors.surface0,
		indexed = {
			[16] = colors.peach,
			[17] = colors.rosewater,
		},
		scrollbar_thumb = colors.surface2,
		compose_cursor = colors.flamingo,
		ansi = {
			colors.surface0,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.text,
		},
		brights = {
			colors.surface2,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.surface2,
		},
		tab_bar = {
			background = colors.mantle,
			active_tab = {
				bg_color = "none",
				fg_color = colors.subtext1,
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			inactive_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.subtext0,
			},
			new_tab = {
				bg_color = colors.base,
				fg_color = colors.subtext0,
			},
			new_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.surface2,
			},
		},
	}
end

return Theme
