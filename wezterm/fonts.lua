local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
	config.font = wezterm.font_with_fallback({
		"Liga SFMono Nerd Font",
		"Apple Color Emoji",
	})

	config.font_rules = {
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = "CartographCF Nerd Font",
					weight = "Bold",
					italic = true,
				},
			}),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = "CartographCF Nerd Font",
					italic = true,
				},
			}),
		},
		{
			intensity = "Half",
			italic = true,
			font = wezterm.font_with_fallback({
				{
					family = "CartographCF Nerd Font",
					weight = "Light",
					italic = true,
				},
			}),
		},
	}
	config.font_size = 12
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.line_height = 1.5
end

return Fonts
