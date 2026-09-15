------------------
----kybindings----
------------------

local mainMod = "SUPER" 

local closeWindowBind = hl.bind("ALT + F4", hl.dsp.window.close())
--closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseuddo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit")) --dwindle
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(ipc launcher toggle)) --"ipc ..." for noctalia "menu" for quickshell

--noctalia
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc controlCenter toggle))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd(ipc settings toggle))

--move/focus window
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " SHIFT + H", hl.dsp.window({ direction = "left" }))
hl.bind(mainMod .. " SHIFT + L", hl.dsp.window({ direction = "right" }))
hl.bind(mainMod .. " SHIFT + K", hl.dsp.window({ direction = "up" }))
hl.bind(mainMod .. " SHIFT + J", hl.dsp.window({ direction = "down" }))

--switch workspaces



