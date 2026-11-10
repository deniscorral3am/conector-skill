# Los 5 conectores de Claude, de una vez

Por Denís Corral · @deniscorralvillarraso en Instagram · [Sell Your AI](https://sellyourai.io)

Con estos 5 conectores, Claude deja de ser un chat y empieza a trabajar con tus cosas:

- **Composio**: un solo conector para cientos de apps (Gmail, Calendar, Drive, Notion, Slack, HubSpot…).
- **Firecrawl**: lee cualquier web y rastrea sitios enteros.
- **Perplexity**: busca en internet con fuentes y datos del día.
- **Playwright**: Claude maneja un navegador (abre, hace clic, rellena, saca capturas).
- **PostHog**: le preguntas por las analíticas de tu web o tu app.

Abre Claude Code (en la Terminal o en la pestaña Code de la app de Claude) y pega todo lo que hay dentro del recuadro.
¿Prefieres la versión completa? `git clone https://github.com/deniscorral3am/conector-skill ~/.claude/skills/conector`
y escribe `/conector`.

---

```
Quiero dejar configurados en Claude Code estos 5 conectores (servidores MCP), uno detrás de otro: Composio,
Firecrawl, Perplexity, Playwright y PostHog. Háblame en español, corto y sin tecnicismos, y antes de cada uno dime en
una frase para qué sirve. Regla de oro: NUNCA me pidas una clave por el chat. Siempre que se pueda, entro con mi
cuenta en el navegador.

1 · MIRA LO QUE TENGO
- Comprueba que tengo Node 18 o más (node -v) y ejecuta claude mcp list. No toques los conectores que ya estén.
- Pregúntame solo si los quiero en todos mis proyectos (recomendado: -s user) o solo en esta carpeta.

2 · AÑÁDELOS (ejecuta tú los comandos)
- Composio:   claude mcp add --transport http composio https://connect.composio.dev/mcp -s user
- Firecrawl:  claude mcp add --transport http firecrawl https://mcp.firecrawl.dev/v2/mcp-oauth -s user
  (si no quiero crear cuenta: https://mcp.firecrawl.dev/v2/mcp funciona sin clave con límites diarios)
- Perplexity: claude mcp add --transport http perplexity https://api.perplexity.ai/mcp -s user
  (avísame: se paga por uso con saldo de la API de Perplexity, no con la suscripción Pro. Si no quiero, sáltalo)
- Playwright: claude mcp add playwright -s user -- npx @playwright/mcp@latest
- PostHog:    claude mcp add --transport http posthog https://mcp.posthog.com/mcp -s user

3 · QUE YO ENTRE CON MI CUENTA
- Dime que reinicie Claude Code, escriba /mcp y entre en cada uno que diga que necesita autenticación: se abre el
  navegador, inicio sesión y acepto. Composio, Firecrawl, Perplexity y PostHog funcionan así. Playwright no pide nada.
- Solo si alguno no me deja entrar por el navegador: dime que cree la clave en su web y que la guarde YO en mi Terminal
  (echo 'export NOMBRE_DE_LA_CLAVE="..."' >> ~/.zshrc). Tú añades la versión local leyendo la variable, sin verla:
  claude mcp add perplexity -s user --env 'PERPLEXITY_API_KEY=${PERPLEXITY_API_KEY}' -- npx -y @perplexity-ai/mcp-server
  (y para Firecrawl, FIRECRAWL_API_KEY con el paquete firecrawl-mcp). Nunca escribas una clave en un comando,
  un archivo o un commit.

4 · PRUÉBALOS
- Con /mcp, todos conectados. Luego una prueba real por conector y enséñame el resultado:
  Composio: qué apps tengo conectadas (y si quiero, conecta Gmail y léeme el asunto de mi último correo).
  Firecrawl: lee la página de inicio de mi web y resúmela en 3 líneas.
  Perplexity: una noticia de esta semana de mi sector, con fuentes.
  Playwright: abre mi web y saca una captura.
  PostHog: visitas de la última semana, si tengo proyecto.
- Si uno falla, /mcp para reconectarlo; si sigue, sáltalo y sigue con los demás.

5 · EN CLAUDE.AI (OPCIONAL)
- Dime cómo tenerlos también en claude.ai: Configuración → Conectores → Añadir conector personalizado con el nombre
  y la URL de cada uno (Firecrawl también está en el directorio de conectores). Playwright no: solo funciona en el
  ordenador.

6 · AL TERMINAR
- Tabla corta: conector, conectado o no, coste y una cosa útil que ya le puedo pedir a cada uno.
- Recuérdame que Composio y Playwright pueden actuar en mi nombre: antes de mandar algo o hacer algo que no se pueda
  deshacer, pregúntame.

Empieza por el paso 1.
```

---

## Lo que cuesta cada uno (comprobado el 10/11/2026)

| Conector | Cómo entras | Coste |
|---|---|---|
| Composio | Tu cuenta, en el navegador | Gratis hasta 10.000 llamadas al mes, sin tarjeta |
| Firecrawl | Tu cuenta, en el navegador (o sin cuenta, con límites) | Gratis 1.000 créditos al mes, sin tarjeta |
| Perplexity | Tu cuenta de la API, en el navegador | De pago por uso |
| Playwright | Nada, corre en tu ordenador | Gratis |
| PostHog | Tu cuenta, en el navegador | Conectar es gratis |

Composio, Firecrawl, Perplexity, Playwright y PostHog son marcas de sus dueños; Claude, de Anthropic. Los precios
pueden cambiar: míralos en la web de cada uno antes de pagar.
