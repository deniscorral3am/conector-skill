# Qué está comprobado (10/11/2026)

Probado sin credenciales con una petición MCP `initialize` a cada URL, más la documentación oficial:

- **Composio** `https://connect.composio.dev/mcp`: existe; responde 401 con `WWW-Authenticate` y metadatos OAuth
  (`/.well-known/oauth-protected-resource`, servidor de autorización `connect.composio.dev`). Composio la da como URL
  del conector de Claude (composio.dev/claude: Configuración → Conectores → Añadir conector personalizado). Precio
  (composio.dev/pricing): gratis 10.000 llamadas/mes sin tarjeta; Standard 18 $/puesto/mes.
- **Perplexity** `https://api.perplexity.ai/mcp`: existe; 401 con metadatos OAuth. Docs oficiales
  (docs.perplexity.ai/guides/mcp-server): `claude mcp add --transport http perplexity https://api.perplexity.ai/mcp`,
  entrar con `/mcp`, o clave como cabecera Bearer; local `@perplexity-ai/mcp-server` con `PERPLEXITY_API_KEY`. Se cobra
  a precio de API; para OAuth hay que ser administrador de una organización de la API con forma de pago.
- **Firecrawl** `https://mcp.firecrawl.dev/v2/mcp-oauth`: 401 pidiendo token OAuth o `x-firecrawl-api-key`
  (docs.firecrawl.dev/mcp-server). `https://mcp.firecrawl.dev/v2/mcp` responde 200 sin clave (búsqueda, lectura y
  parse con límites diarios). Precio: gratis 1.000 créditos/mes sin tarjeta; Hobby 19 $/mes. Paquete local
  `firecrawl-mcp` (npm 3.39.0).
- **PostHog** `https://mcp.posthog.com/mcp`: 401 con metadatos OAuth (`oauth.posthog.com`). Docs:
  `claude mcp add --transport http posthog https://mcp.posthog.com/mcp -s user`, el asistente
  `npx @posthog/wizard mcp add` o `claude plugin install posthog`; entra con la cuenta y elige solo la región. Conectar
  es gratis; las herramientas con IA cuentan como gasto de IA de PostHog.
- **Playwright** (github.com/microsoft/playwright-mcp): `claude mcp add playwright npx @playwright/mcp@latest`, Node
  18+, sin claves, Apache-2.0. En este Mac ya estaba conectado así.
- `scripts/comprobar.sh` probado en macOS.

## Sin probar todavía

- El inicio de sesión OAuth completo de cada uno desde `/mcp` (no se ha conectado nada en la cuenta de Denis).
- El conector de Firecrawl en el directorio de claude.ai y los conectores personalizados en claude.ai (qué planes de
  Claude los permiten).
- Las cifras exactas del plan gratis de PostHog y el uso mínimo de la API de Perplexity.
