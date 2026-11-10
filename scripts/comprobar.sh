#!/usr/bin/env bash
# Comprueba lo que necesita /conector: Claude Code, Node (para Playwright) y cuáles de los 5 conectores ya están.
# Solo lee: no instala ni cambia nada.
ok(){ printf '  ✓ %s\n' "$1"; }; ko(){ printf '  ✗ %s\n' "$1"; }; av(){ printf '  · %s\n' "$1"; }
echo "Comprobando…"
if command -v claude >/dev/null 2>&1; then ok "Claude Code $(claude --version 2>/dev/null | head -1)"
else ko "No veo Claude Code (claude.com/claude-code)"; exit 0; fi
if command -v node >/dev/null 2>&1; then
  v=$(node -v | tr -d v | cut -d. -f1)
  if [ "$v" -ge 18 ] 2>/dev/null; then ok "Node $(node -v) (Playwright necesita 18 o más)"; else ko "Node $(node -v) es antiguo: Playwright necesita 18 o más"; fi
else ko "Falta Node (Playwright lo necesita): brew install node"; fi
L=$(claude mcp list 2>/dev/null)
for c in composio firecrawl perplexity playwright posthog; do
  linea=$(printf '%s\n' "$L" | grep -i "^$c[^:]*:" | head -1)
  if [ -z "$linea" ]; then av "$c: no está (se añade)"
  elif printf '%s' "$linea" | grep -q "✔"; then ok "$c: ya conectado"
  else av "$c: añadido pero sin entrar (en Claude Code, /mcp → $c → iniciar sesión)"; fi
done
