# LazyTrigger.nvim

一个极简的 Neovim 插件，用于延迟触发用户定义的事件，优化您的 Neovim 启动时间或在特定条件满足时执行操作。

## ✨ 特性

- **延迟事件触发**: 在指定延迟后触发自定义用户事件。
- **轻量级**: 插件代码简洁，不引入额外负担。
- **可配置**: 灵活配置调试模式和延迟事件。

## 🚀 安装

使用您喜欢的插件管理器安装。

**lazy.nvim**:

```lua
{
  'doodleEsc/LazyTrigger.nvim', -- 替换为您的 GitHub 用户名/仓库名
  config = function()
    require('lazytrigger').setup({
      -- 您的配置选项
    })
  end
}
```

## ⚙️ 配置

`LazyTrigger.nvim` 可以通过 `setup()` 函数进行配置。以下是可用的选项及其默认值：

```lua
require('lazytrigger').setup({
    -- 打印关于事件触发和操作执行原因的有用日志。
    debug = false,
    -- 要延迟触发的事件列表。
    events = {
        {
            -- 事件名称，将作为 `User` 自动命令的模式触发。
            name = "MyDeferEvent",
            -- 延迟时间（毫秒）。
            delay = 100,
        },
        -- 您可以添加更多事件
        -- {
        --    name = "AnotherDeferredEvent",
        --    delay = 500,
        -- },
    },
})
```

## 💡 使用

`LazyTrigger.nvim` 的核心思想是延迟触发 `User` 自动命令。您可以在 `events` 配置中定义这些事件，并在您的配置中监听它们。

**示例**: 延迟加载一个插件或执行一些耗时操作。

在您的 `init.lua` (或任何 Neovim 配置) 中：

```lua
-- 在 LazyTrigger.nvim setup 中定义事件
require('lazytrigger').setup({
    events = {
        {
            name = "MyPluginLoadEvent",
            delay = 200, -- 200毫秒后触发
        },
    },
})

-- 监听 MyPluginLoadEvent 并执行操作
vim.api.nvim_create_autocmd("User", {
    pattern = "MyPluginLoadEvent",
    callback = function()
        print("MyPluginLoadEvent triggered! Loading my plugin...")
        -- 在这里放置您的插件加载逻辑或耗时操作
    end,
})

-- 您也可以手动触发或切换 LazyTrigger 的状态
-- require('lazytrigger').toggle() -- 切换启用/禁用状态
-- require('lazytrigger').enable()  -- 启用
-- require('lazytrigger').disable() -- 禁用
```

## ⚡ 命令

| 命令           | 描述                     | 用法           |
|----------------|--------------------------|----------------|
| `:LazyTrigger` | 切换插件的启用/禁用状态。| `:LazyTrigger` |

## 🤝 贡献

欢迎贡献！如果您有任何问题、建议或想报告 bug，请随时在 GitHub 上提出 issue 或提交 Pull Request。

## 📄 许可证

本项目使用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。
