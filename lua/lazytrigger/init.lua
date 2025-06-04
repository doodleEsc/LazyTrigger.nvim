local main = require("lazytrigger.main")
local config = require("lazytrigger.config")

local LazyTrigger = {}

--- Toggle the plugin by calling the `enable`/`disable` methods respectively.
function LazyTrigger.toggle()
    if _G.LazyTrigger.config == nil then
        _G.LazyTrigger.config = config.options
    end

    main.toggle("public_api_toggle")
end

--- Initializes the plugin, sets event listeners and internal state.
function LazyTrigger.enable(scope)
    if _G.LazyTrigger.config == nil then
        _G.LazyTrigger.config = config.options
    end

    main.toggle(scope or "public_api_enable")
end

--- Disables the plugin, clear highlight groups and autocmds, closes side buffers and resets the internal state.
function LazyTrigger.disable()
    main.toggle("public_api_disable")
end

-- setup LazyTrigger options and merge them with user provided ones.
function LazyTrigger.setup(opts)
    _G.LazyTrigger.config = config.setup(opts)
end

_G.LazyTrigger = LazyTrigger

return _G.LazyTrigger
