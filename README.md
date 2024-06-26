# wezterm-config

我的 WezTerm 配置，基于 [KevinSilvester/wezterm-config](https://github.com/KevinSilvester/wezterm-config)。

## 变化

除了适配我自己的环境，还对上游配置进行了以下主要修改：

- 使用中文显示标题栏右侧的星期
- 简化标签页标题（包含一些修复）：
  - 修复某些情况下标题可能为空（如给 Neovim 配置 `vi` 别名，并用 `sudo` 启动时）
  - 修复 Windows 上重复显示 Powershell 标题
- 在 Windows 上默认使用和 VS Code 一样的字体

## 结语

参考我博客文章了解 WezTerm 的更多用法和配置：

- [跨平台、GPU 加速、高定制性的终极终端 WezTerm 的介绍和配置](https://blog.hentioe.dev/posts/wezterm.html)
