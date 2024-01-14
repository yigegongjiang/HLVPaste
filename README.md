# HLVPaste

因本人经常需要通过 Mac 键盘在 iPhone 输入框中写入一些文本。通过蓝牙等方式有些费力，不 nice。  
于是做了这个小工具，主要依托 Apple 平台的 Handoff 能力，快速将文本从 Mac 侧粘贴到 iPhone 侧。

## Demo

![demo](./demo.png)

## Function

1. 通过 LaunchBar 等启动工具，可快速打开 app `HLVPaste` 并获得焦点（如已经打开，上一次的内容会自动清空）。
2. `HLVPaste` 有非常小巧的界面，输入文本后即可移动到其他窗口。文本会自动 copy 到 Mac 粘贴版。
2. 在 iPhone 设备上可 Paste，获取到 Mac 的粘贴版内容。
