#!/usr/bin/env bash
# Installiert `cheatsheet`, indem ein Symlink in ein PATH-Verzeichnis gelegt wird.
# Aufruf: ./install.sh [--uninstall] [zielverzeichnis]   (Standard: ~/.local/bin)
set -euo pipefail

SRC="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)/cheatsheet"
UNINSTALL=0
[[ "${1:-}" == "--uninstall" ]] && { UNINSTALL=1; shift; }
BIN_DIR="${1:-$HOME/.local/bin}"
LINK="$BIN_DIR/cheatsheet"

if (( UNINSTALL )); then
  if [[ -L "$LINK" ]]; then rm "$LINK"; echo "✓ Entfernt: $LINK"
  else echo "Nichts zu entfernen ($LINK ist kein Symlink)."; fi
  exit 0
fi

[[ -f "$SRC" ]] || { echo "✗ Skript nicht gefunden: $SRC" >&2; exit 1; }
chmod +x "$SRC"
mkdir -p "$BIN_DIR"

if [[ -e "$LINK" && ! -L "$LINK" ]]; then
  echo "✗ $LINK existiert und ist kein Symlink – Abbruch." >&2; exit 1
fi
ln -sf "$SRC" "$LINK"
echo "✓ Installiert: $LINK -> $SRC"

case ":$PATH:" in
  *":$BIN_DIR:"*) echo "Fertig. Probiere: cheatsheet" ;;
  *) echo "⚠ $BIN_DIR liegt nicht im PATH. Füge zu ~/.bashrc hinzu:"
     echo "    export PATH=\"$BIN_DIR:\$PATH\"" ;;
esac
