#!/usr/bin/env bash

# 現在時刻を取得して、このアイテム(clock)のラベルにセットする
sketchybar --set "$NAME" label="$(date '+%m/%d %H:%M')"
