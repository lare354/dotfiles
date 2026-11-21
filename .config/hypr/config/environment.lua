-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Enviroment Configuration                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config.defaults")

hl.env("HYPRCURSOR_SIZE", "24", true)
hl.env("BROWSER", browser, true)
hl.env("XCURSOR_SIZE", "24", true)
hl.env("QT_CURSOR_SIZE", "24", true)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland", true)
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct", true)
