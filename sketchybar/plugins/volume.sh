#!/usr/bin/env bash

# 1. switchaudio-osx を使って現在のデバイス名を取得（エラー時はフォールバック）
CURRENT_DEVICE=$(SwitchAudioSource -c 2>/dev/null || echo "Unknown")

# 音量とミュート状態を取得（エラー時はフォールバック）
VOLUME=$(osascript -e "output volume of (get volume settings)" 2>/dev/null || echo "0")
MUTED=$(osascript -e "output muted of (get volume settings)" 2>/dev/null || echo "false")

# --- アイコン設定ロジック ---
if [ "$MUTED" = "true" ]; then
    ICON="󰝟"
    ICON_COLOR=0xff999999
else
    # デバイス名に特定の文字が含まれているかで判定
    case "$CURRENT_DEVICE" in
        *"Headphone"* | *"AirPods"* | *"JBL"* | *"Sony"* | *"Headset"* | *"Bluetooth"* | *"Tour Pro 3"*)
            ICON="" # ヘッドホンアイコン
            ;;
        *)
            ICON="󰕾" # スピーカーアイコン
            ;;
    esac
    ICON_COLOR=0xffffffff
fi

# Sketchybarに反映
sketchybar --set "$NAME" icon="$ICON" \
    icon.color=$ICON_COLOR \
    label="$VOLUME%"
