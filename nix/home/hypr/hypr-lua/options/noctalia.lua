----------------------
----noctalia stuff----
----------------------

local ipc = "noctalia msg "

hl.bind("ALT + SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind("SUPER + S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind("ALT + TAB", hl.dsp.exec_cmd(ipc .. "window-switcher"))

hl.layer_rule({
	name = "noctalia",
	match = { 
		namespace = "^noctalia-(bar-.+)|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

