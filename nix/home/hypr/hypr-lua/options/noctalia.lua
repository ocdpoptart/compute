----------------------
----noctalia stuff----
----------------------

local ipc = "qs -c noctalia-shell ipc call"

hl.bind("ALT + SPACE", hl.dsp.exec_cmd(ipc launcher toggle))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc controlCenter toggle))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(ipc settings toggle))

hl.layer_rule({
	name = "noctalia",
	match = { namespace = noctalia-background-.*$},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
