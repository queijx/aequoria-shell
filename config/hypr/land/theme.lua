hl.config({
	general = {

		gaps_in = 5,
		gaps_out = 10,
		border_size = 0,

		col = {

			active_border = "rgba(ffffffff)",
			inactive_border = "rgba(ffffffff)",
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {

		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {

			enabled = true,
			range = 7,
			render_power = 2,
			color = 0xff000000,
		},

		blur = {
			enabled = true,

			size = 8,
			passes = 1,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = false,
	},
})
