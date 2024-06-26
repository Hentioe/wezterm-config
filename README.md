# wezterm-config

我的 WezTerm 配置，基于 [KevinSilvester/wezterm-config](https://github.com/KevinSilvester/wezterm-config)。

## 使用

1. 安装 Noto Sans Mono 和 Noto Sans Mono CJK 字体（仅 Linux 需要）
1. 克隆仓库到 `~/.config/wezterm`:

   ```sh
   git clone https://github.com/Hentioe/wezterm-config.git ~/.config/wezterm
   ```

## 变化

除了适配我自己的环境，还对上游配置进行了以下主要修改：

- 使用中文显示标题栏右侧的星期（周一至周日）
- 简化标签页标题（包含一些修复）：
  - 修复某些情况下标题可能为空（如给 Neovim 配置 `vi` 别名，并用 `sudo` 启动时）
  - 修复 Windows 上重复显示 Powershell 标题
- 在 Windows 上使用 VS Code 的默认字体

## 结语

参考我博客文章了解 WezTerm 的更多用法和配置：

- [跨平台、GPU 加速、高定制性的终极终端 WezTerm 的介绍和配置](https://blog.hentioe.dev/posts/wezterm.html)
