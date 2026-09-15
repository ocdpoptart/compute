--------------------------
----windows&workspaces----
--------------------------

--ref https://wiki.hypr.land/Configuring/Basics/Window-Rules/
--& https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

--window
	local suppressMaximizeRule = hl.window_rule({
		--ignore maximize requests from all apps
		name = "suppress-maximize-events",
		match = { class = ".*" },
		suppress_event = "maximize",
	})
	--suppressMaximizeRule:set_enabled(false)
	
	hl.window_rule({
		--xwayland dragging fix
		name = "fix-xwayland-drags",
		match = {
			class = "^$",
			title = "^$",
			xwayland = true,
			float = true,
			fullscreen = false,
			pin = false,
		},
		no_focus = true,
	})

--workspace
	--per-workspace layouts
		--hl.workspace_rule({ workspace = "2", layout = "scrolling" })
	--"smart gaps" / "no gaps only when"
		hl.workspace_rule({ workspace = "name:game/vid", no_rounding = true, decorate = false, gaps_in = 0, gaps_out = 0, no_border = true, monitor = "desc:Samsung Electric Company LS49AG95 HCSRC00778"})	
