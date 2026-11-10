# Conector · los 5 conectores de Claude, de una vez

Composio, Firecrawl, Perplexity, Playwright y PostHog en Claude Code (y en claude.ai), configurados en un rato,
probados y **sin pegar ninguna clave en el chat**: entras con tu cuenta en el navegador.

| Conector | Para qué |
|---|---|
| Composio | Un solo conector para cientos de apps: Gmail, Calendar, Drive, Notion, Slack, HubSpot… |
| Firecrawl | Leer cualquier web y rastrear sitios enteros |
| Perplexity | Buscar en internet con fuentes |
| Playwright | Que Claude maneje un navegador |
| PostHog | Las analíticas de tu web o tu app |

Hecha por Denís Corral · [@deniscorralvillarraso](https://instagram.com/deniscorralvillarraso) · [Sell Your AI](https://sellyourai.io)

## Instalación

```bash
git clone https://github.com/deniscorral3am/conector-skill ~/.claude/skills/conector
```

Abre Claude Code y escribe `/conector`.

¿Sin instalar nada? Copia el recuadro de [`PROMPT.md`](PROMPT.md) y pégalo en Claude Code.

## Qué necesitas

- [Claude Code](https://claude.com/claude-code) (Terminal o pestaña Code de la app de Claude).
- Node 18 o más (para Playwright).
- Cuenta gratis en Composio, Firecrawl y PostHog, y saldo en la API de Perplexity si quieres ese (es de pago por uso).

## Bueno saber

- Composio y Playwright pueden actuar en tu nombre (mandar correos, hacer clics): la skill pregunta antes de algo que
  no se pueda deshacer.
- Quitar un conector: `claude mcp remove <nombre> -s user`. Los permisos de cada app se revocan en la web del servicio.
- Precios y planes comprobados el 10/11/2026 (ver `PROBADO.md`); pueden cambiar.

## Licencia

MIT
