#!/usr/bin/env bash
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3.13}"

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN="python3"
  elif command -v python >/dev/null 2>&1; then
    PYTHON_BIN="python"
  else
    echo "No Python interpreter found (tried python3.13, python3, python)."
    exit 1
  fi
fi

echo "[1/4] Using Python executable: $PYTHON_BIN"
"$PYTHON_BIN" --version

echo "[2/4] Upgrading pip and installing required packages"
"$PYTHON_BIN" -m pip install --user --upgrade pip
"$PYTHON_BIN" -m pip install --user -r requirements.txt

echo "[3/4] Verifying imports (docopt, scipy, numpy, csv, graphviz)"
"$PYTHON_BIN" -c "import docopt, scipy, numpy, csv, graphviz; print('ok')"

echo "[4/4] Done"
