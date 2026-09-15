-------------
----input----
-------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no mod

		touchpad = { 
			natural_scroll = false, 
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name =  "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.device({
	name = "wacom-cintiq-16-pen",
	output = "desc:Wacom Tech Cintiq 16 1KW00X1003730",
})

