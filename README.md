# LazyTrigger.nvim

A minimalist Neovim plugin for lazily triggering user-defined events, optimizing your Neovim startup time or executing actions when specific conditions are met.

## ✨ Features

- **Lazy Event Triggering**: Trigger custom user events after a specified delay.
- **Lightweight**: The plugin code is concise and does not introduce additional overhead.
- **Configurable**: Flexible configuration for debug mode and lazy events.

## 🚀 Installation

Install using your favorite plugin manager.

**lazy.nvim**:

```lua
{
  'doodleEsc/LazyTrigger.nvim', -- Replace with your GitHub username/repository name
  config = function()
    require('lazytrigger').setup({
      -- Your configuration options
    })
  end
}
```

## ⚙️ Configuration

`LazyTrigger.nvim` can be configured via the `setup()` function. Below are the available options and their default values:

```lua
require('lazytrigger').setup({
    -- Prints useful logs about event triggers and reasons for action execution.
    debug = false,
    -- List of events to trigger lazily.
    events = {
        {
            -- Event name, will be triggered as a pattern for `User` autocommand.
            name = "MyDeferEvent",
            -- Delay time (milliseconds).
            delay = 100,
        },
        -- You can add more events
        -- {
        --    name = "AnotherDeferredEvent",
        --    delay = 500,
        -- },
    },
})
```

## 💡 Usage

The core idea of `LazyTrigger.nvim` is to lazily trigger `User` autocommands. You can define these events in the `events` configuration and listen for them in your Neovim configuration.

**Example**: Lazily load a plugin or perform some time-consuming operations.

In your `init.lua` (or any Neovim configuration):

```lua
-- Define events in LazyTrigger.nvim setup
require('lazytrigger').setup({
    events = {
        {
            name = "MyPluginLoadEvent",
            delay = 200, -- Trigger after 200 milliseconds
        },
    },
})

-- Listen for MyPluginLoadEvent and perform actions
vim.api.nvim_create_autocmd("User", {
    pattern = "MyPluginLoadEvent",
    callback = function()
        print("MyPluginLoadEvent triggered! Loading my plugin...")
        -- Place your plugin loading logic or time-consuming operations here
    end,
})

-- You can also manually trigger or toggle LazyTrigger's state
-- require('lazytrigger').toggle() -- Toggle enable/disable state
-- require('lazytrigger').enable()  -- Enable
-- require('lazytrigger').disable() -- Disable
```

## ⚡ Commands

| Command        | Description                 | Usage          |
| -------------- | --------------------------- | -------------- |
| `:LazyTrigger` | Toggles the plugin's state. | `:LazyTrigger` |

## 🤝 Contributing

Contributions are welcome! If you have any questions, suggestions, or want to report bugs, feel free to open an issue or submit a Pull Request on GitHub.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
