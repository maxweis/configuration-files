-- Extra autostart processes.
-- o.launch_on_start("my-service")
hl.exec_cmd("inputactions-client")
hl.exec_cmd("pgrep -x hypridle >/dev/null || hypridle")
