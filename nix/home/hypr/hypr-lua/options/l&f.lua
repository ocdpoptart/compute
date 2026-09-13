---------------------
----look and feel----
---------------------

hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,

		--col = {
			--active_border = { colors = {"rgba(22ccffee)", "rgba(0ff99ee)", angle = 45 },
			--inactive_border = "rgba(595959aa)",
		--},

		resize_on_border = false,

		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		active_opacity = 1.0,
		inactive_opacity = 0.90,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = rgba(1a1a1aee),
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},

		animations = {
			enabled = true,
		},
})

--Default curves/animations
hl.curve("easeOutQuint", {type = "bezier", points = { {0.23, 1}, {0.32, 1} }})
hl.curve()
hl.curve()
hl.curve()
hl.curve()
