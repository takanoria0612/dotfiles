#!/usr/bin/env bash

# --- Tokyo Night Color Palette ---
COLOR_ACCENT=0xff7aa2f7    # アクティブな背景色 (Tokyo Night Blue)
COLOR_DARK=0xff15161e      # アクティブなアイコン色
COLOR_MUTED=0xffa9b1d6     # 非アクティブなアイコン色

# $1 にはワークスペース名 (1, T, B, C...) が入っている

# --- アイコン変換ロジック ---
case "$1" in
    I) ICON="" ;;     # Terminal(iTerm2)
    T) ICON="󰊻" ;;    # Teams
    B) ICON="🦁" ;;    # Brave
    C) ICON="" ;;     # Chrome
    P) ICON="" ;;     # PyCharm
    Y) ICON="" ;;     # Youtube
    O) ICON="" ;;
    *) ICON="$1" ;;    # その他
esac

# --- フォーカス判定 ---
# $FOCUSED_WORKSPACE は exec-on-workspace-change から環境変数として渡される
# aerospace コマンドの呼び出しを排除しパフォーマンス向上
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    # 【アクティブ】Tokyo Night Blue背景 + 暗い文字
    sketchybar --set "$NAME" \
        background.drawing=on \
        background.color=$COLOR_ACCENT \
        label.drawing=off \
        icon="$ICON" \
        icon.color=$COLOR_DARK
else
    # 【非アクティブ】背景なし + 落ち着いた白文字
    sketchybar --set "$NAME" \
        background.drawing=off \
        label.drawing=off \
        icon="$ICON" \
        icon.color=$COLOR_MUTED
fi
