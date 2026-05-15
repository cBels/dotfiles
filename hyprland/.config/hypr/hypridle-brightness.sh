#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 dim|bright" >&2
    exit 1
}

if [ "$#" -ne 1 ]; then
    usage
fi

action="$1"
case "$action" in
    dim) value=20 ;;
    bright) value=100 ;;
    *) usage ;;
esac

if command -v ddcutil >/dev/null 2>&1 && ls /dev/i2c-* >/dev/null 2>&1; then
    mapfile -t buses < <(ddcutil detect --sleep-multiplier=1 2>/dev/null | grep -oE '/dev/i2c-[0-9]+' | sed 's#/dev/i2c-##')
    if [ "${#buses[@]}" -gt 0 ]; then
        for bus in "${buses[@]}"; do
            ddcutil --bus "$bus" setvcp 10 "$value" --sleep-multiplier=1 || true
        done
        exit 0
    fi
fi

if command -v wlr-randr >/dev/null 2>&1; then
    if [ "$action" = dim ]; then
        wlr-randr --output DP-2 --brightness 0.2 || true
        wlr-randr --output HDMI-A-1 --brightness 0.2 || true
    else
        wlr-randr --output DP-2 --brightness 1.0 || true
        wlr-randr --output HDMI-A-1 --brightness 1.0 || true
    fi
fi
