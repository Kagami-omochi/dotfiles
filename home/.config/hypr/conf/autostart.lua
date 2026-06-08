-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- Autostart necessary processes (like notifications daemons, status bars, etc.)

hl.on("hyprland.start", function () 
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
