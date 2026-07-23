#!/bin/bash
# ⚒️ Solvesmith installer — curl로 받으면 macOS 격리 속성(quarantine)이 붙지 않아
# "손상되었습니다" 경고 없이 설치됩니다. 사용:
#   curl -fsSL https://gwonsoolee.github.io/solvesmith-releases/install.sh | bash
set -euo pipefail

echo "⚒️  Solvesmith installer"

API="https://api.github.com/repos/GwonsooLee/solvesmith-releases/releases/latest"
URL=$(curl -fsSL "$API" | grep -o '"browser_download_url": *"[^"]*\.dmg"' | head -1 | sed 's/.*"\(https[^"]*\)"/\1/')
if [ -z "$URL" ]; then
  echo "❌ 최신 릴리스를 찾지 못했습니다. 네트워크를 확인하세요." >&2
  exit 1
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "⬇  downloading $(basename "$URL") ..."
curl -fL --progress-bar -o "$TMP/solvesmith.dmg" "$URL"

MOUNT=$(hdiutil attach "$TMP/solvesmith.dmg" -nobrowse | awk -F'\t' '/\/Volumes\// {print $NF; exit}')
if [ -z "$MOUNT" ] || [ ! -d "$MOUNT/Solvesmith.app" ]; then
  echo "❌ DMG 마운트에 실패했습니다." >&2
  exit 1
fi

DEST="/Applications"
if [ ! -w "$DEST" ]; then
  DEST="$HOME/Applications"
  mkdir -p "$DEST"
fi

# 실행 중이면 정상 종료 후 교체 (구 이름 앱도 함께 정리)
osascript -e 'quit app "Solvesmith"' >/dev/null 2>&1 || true
osascript -e 'quit app "Codeforce Helper"' >/dev/null 2>&1 || true
sleep 1
rm -rf "$DEST/Solvesmith.app" "$DEST/Codeforce Helper.app"

echo "📦 installing to $DEST ..."
cp -R "$MOUNT/Solvesmith.app" "$DEST/"
hdiutil detach "$MOUNT" -quiet
# curl 다운로드에는 격리 속성이 없지만, 만약을 위해 한 번 더 정리
# (xattr -r은 최신 macOS에서 제거됨 — find로 버전 무관하게)
find "$DEST/Solvesmith.app" -exec xattr -c {} + 2>/dev/null || true

echo "✅ Solvesmith installed — launching"
open "$DEST/Solvesmith.app"
