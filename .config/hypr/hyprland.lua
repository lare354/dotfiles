-- gen by confToLua.py
-- Source: hyprland.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


-- Variables
mainMod = "SUPER"

-- General Config
hl.config({
	input = {
		touchpad = {
			natural_scroll = true,
			tap-to-click = true,
			drag_lock = true,
			disable_while_typing = false,
		},
		kb_layout = "se",
		kb_variant = "",
		kb_model = "pc101",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		numlock_by_default = 1,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
	},
	debug = {
		disable_logs = false,
		enable_stdout_logs = true,
		full_cm_proto = true,
	},
	general = {
		gaps_in = 2,
		gaps_out = 2,
		border_size = 2,
		col = {
			active_border = "$mauve",
			inactive_border = "$surface0",
		},
		layout = "master",
		resize_on_border = true,
		extend_border_grab_area = 5,
	},
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
		mfact = 0.5,
	},
})

-- Requires
require("lua.config.colours")
require("lua.config.defaults")
require("lua.config.monitor")
require("lua.config.decorations")
require("lua.config.animations")
require("lua.config.environment")
require("lua.config.autostart")
require("lua.config.keybinds")
