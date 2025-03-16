local hyper = { "cmd", "alt", "ctrl", "shift" }

function reloadConfig(files)
	doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

local function appBind(key, app)
	hs.hotkey.bind(hyper, key, function()
		hs.application.launchOrFocus(app)
	end)
end

local browsers = {
	chrome = "Google Chrome",
	firefox = "Firefox",
	arc = "Arc",
}

local termHotkey = "1"
local function swapTerminalAndCode()
	if termHotkey == "`" then
		termHotkey = "1"
		appBind("1", "WezTerm")
		-- appBind("1", "kitty")
		appBind("`", "Visual Studio Code")
		hs.alert.show("Terminal is now 1")
	else
		termHotkey = "`"
		appBind("`", "WezTerm")
		-- appBind("`", "kitty")
		appBind("1", "Visual Studio Code")
		hs.alert.show("Terminal is now `")
	end
end

appBind("`", "Visual Studio Code")
appBind("1", "Ghostty")
-- appBind("1", "kitty")
appBind("2", "Safari")
appBind("3", "Todoist")
appBind("4", "Obsidian")
appBind("5", "ChatGPT")
appBind("6", "Microsoft Teams")
appBind("F1", "Messages")
appBind("F2", "Spotify")

hs.hotkey.bind(hyper, "F12", swapTerminalAndCode)

hs.alert.show("Config loaded")
