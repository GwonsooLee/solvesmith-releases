# ⚒️ Solvesmith — Downloads

Solutions aren't found — they're **forged**. Solvesmith is a macOS desktop app for Codeforces · LeetCode · AtCoder practice: local judging (C++/Python), staged AI hints, auto-published review notes, and spaced-repetition training.

**⬇ Download: https://gwonsoolee.github.io/solvesmith-releases/**

All versions are available on the [Releases](https://github.com/GwonsooLee/solvesmith-releases/releases) page.

## Install

**One-line install (recommended — no security prompts):**
```bash
curl -fsSL https://gwonsoolee.github.io/solvesmith-releases/install.sh | bash
```

Or manually: open the DMG, drag the app into **Applications**, then run once:
```bash
find "/Applications/Solvesmith.app" -exec xattr -c {} +
```
   ("App is damaged" is macOS Gatekeeper's message for unsigned internet downloads — the app is fine.)

Requirements: macOS (Apple Silicon) · Xcode Command Line Tools · optional Anthropic/OpenAI API key for AI features

> Formerly **Codeforce Helper** — settings migrate automatically on first launch; delete the old app bundle after upgrading.
> This repository hosts distribution binaries only; the source code is private.

---

<details>
<summary>🇰🇷 한국어</summary>

풀이는 찾는 게 아니라 **벼리는** 것. Codeforces · LeetCode · AtCoder 훈련용 macOS 앱입니다.

**⬇ 다운로드: https://gwonsoolee.github.io/solvesmith-releases/**

1. DMG를 열고 앱을 응용 프로그램 폴더로 드래그
2. 한 줄 설치(권장): `curl -fsSL https://gwonsoolee.github.io/solvesmith-releases/install.sh | bash` — 또는 DMG 설치 후 최초 1회 `find "/Applications/Solvesmith.app" -exec xattr -c {} +`

요구 사항: macOS (Apple Silicon) · Xcode Command Line Tools · AI 기능 사용 시 API 키(선택)

</details>
