-----------------
----autostart----
-----------------

hl.on("hyprland.start", function ()
	hl.exec_cmd(terminal)
	hl.exec_cmd("qs -c noctalia-shell --no-duplicate") --change to quickshell when done
	--hl.exec_cmd("/usr/lib/pam_kwallet_init") --secrets wallet dunno if needed
	--hl.exec_cmd("easyeffects & protonvpn") --dunno if i wanna autostart these

end)
