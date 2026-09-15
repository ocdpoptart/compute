-----------------
----autostart----
-----------------

hl.on("hyprland.start", function ()
	hl.exec_cmd("ghostty")
	hl.exec_cmd("noctalia") --change to quickshell when done
	--hl.exec_cmd("/usr/lib/pam_kwallet_init") --secrets wallet dunno if needed
	--hl.exec_cmd("easyeffects & protonvpn") --dunno if i wanna autostart these

end)
