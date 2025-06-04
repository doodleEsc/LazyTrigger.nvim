local log = require("lazytrigger.util.log")

local LazyTrigger = {}

--- LazyTrigger configuration with its default values.
---
---@type table
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
LazyTrigger.options = {
    -- Prints useful logs about what event are triggered, and reasons actions are executed.
    debug = false,
}

---@private
local defaults = vim.deepcopy(LazyTrigger.options)

--- Defaults LazyTrigger options by merging user provided options with the default plugin values.
---
---@param options table Module config table. See |LazyTrigger.options|.
---
---@private
function LazyTrigger.defaults(options)
    LazyTrigger.options = vim.deepcopy(vim.tbl_deep_extend("keep", options or {}, defaults or {}))

    -- let your user know that they provided a wrong value, this is reported when your plugin is executed.
    assert(
        type(LazyTrigger.options.debug) == "boolean",
        "`debug` must be a boolean (`true` or `false`)."
    )

    return LazyTrigger.options
end

--- Define your lazytrigger setup.
---
---@param options table Module config table. See |LazyTrigger.options|.
---
---@usage `require("lazytrigger").setup()` (add `{}` with your |LazyTrigger.options| table)
function LazyTrigger.setup(options)
    LazyTrigger.options = LazyTrigger.defaults(options or {})

    log.warn_deprecation(LazyTrigger.options)

    return LazyTrigger.options
end

return LazyTrigger
