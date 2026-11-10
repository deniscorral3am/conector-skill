---
name: conector
description: Configura de una vez en Claude los 5 conectores que más usamos - Composio (tus apps, Gmail, Calendar, Notion, Slack… con un solo conector), Firecrawl (lee y rastrea webs), Perplexity (busca en internet con fuentes), Playwright (maneja un navegador) y PostHog (las analíticas de tu web o tu producto). Comprueba lo que ya tienes, los añade a Claude Code (y te dice cómo en claude.ai), te deja entrar con tu cuenta en el navegador para no pegar ninguna clave en el chat y prueba cada uno. Úsala cuando digan /conector, «comenta CONECTOR», «conecta Claude a todo», «configura los conectores», «MCP de Composio / Firecrawl / Perplexity / Playwright / PostHog» o «añade conectores a Claude».
---

# /conector: los 5 conectores de Claude, de una vez

Al terminar, el usuario tiene en Claude Code (y si quiere en claude.ai) Composio, Firecrawl, Perplexity, Playwright y
PostHog conectados, probados y sin haber pegado ninguna clave en el chat.

Habla en español, cercano, corto y sin tecnicismos. Uno detrás de otro, y antes de cada uno di en una frase para qué
sirve. **Nunca pidas una clave por el chat.** Siempre que se pueda, el usuario entra con su cuenta en el navegador
(OAuth). `<skill>` = la carpeta de esta skill.

## Paso 0. Qué tiene ya

```bash
bash <skill>/scripts/comprobar.sh
```

Te dice si están Claude Code y Node (Playwright lo necesita, versión 18 o más) y cuáles de los 5 ya están en
`claude mcp list`. No toques los que ya estén conectados. Pregúntale una sola cosa: **¿los quieres en todos tus
proyectos (recomendado, `-s user`) o solo en esta carpeta?**

## Paso 1. Los 5, uno a uno (Claude Code)

Ejecuta tú cada `claude mcp add`. Después de añadirlos todos, que **reinicie Claude Code**, escriba `/mcp` y entre en
cada uno que diga «needs authentication»: se abre el navegador, inicia sesión y acepta. Así la clave nunca pasa por el
chat.

| Conector | Para qué | Comando | Cómo entra | Coste |
|---|---|---|---|---|
| **Composio** | Un solo conector para cientos de apps (Gmail, Calendar, Drive, Notion, Slack, HubSpot…) | `claude mcp add --transport http composio https://connect.composio.dev/mcp -s user` | Cuenta de Composio en el navegador; luego autoriza cada app la primera vez que la use | Plan gratis (10.000 llamadas/mes sin tarjeta); de pago desde 18 $/mes |
| **Firecrawl** | Leer cualquier web, rastrear un sitio entero, sacar datos limpios | `claude mcp add --transport http firecrawl https://mcp.firecrawl.dev/v2/mcp-oauth -s user` | Cuenta de Firecrawl en el navegador | Gratis 1.000 créditos/mes sin tarjeta; de pago desde 19 $/mes |
| **Perplexity** | Buscar en internet con fuentes y respuestas al día | `claude mcp add --transport http perplexity https://api.perplexity.ai/mcp -s user` | «Sign in with Perplexity» en el navegador (elige la organización que paga) | **De pago por uso**: gasta saldo de la API de Perplexity, no la suscripción Pro |
| **Playwright** | Que Claude abra un navegador, haga clic, rellene y saque capturas | `claude mcp add playwright -s user -- npx @playwright/mcp@latest` | Nada: corre en su ordenador | Gratis (código abierto) |
| **PostHog** | Preguntar por las analíticas de su web o su app (visitas, embudos, errores) | `claude mcp add --transport http posthog https://mcp.posthog.com/mcp -s user` | Cuenta de PostHog en el navegador (le lleva solo a EE. UU. o Europa) | Conectar es gratis; algunas herramientas con IA cuentan como gasto de IA de PostHog |

Notas:
- **Firecrawl sin cuenta:** si no quiere registrarse, `https://mcp.firecrawl.dev/v2/mcp` funciona sin clave con
  límites diarios (buscar, leer y «parse»). Para rastrear sitios enteros hace falta cuenta.
- **Perplexity:** para entrar con OAuth tiene que ser administrador de una organización de la API de Perplexity con
  forma de pago. Si no quiere pagar, sáltalo y díselo: Claude ya busca en internet por su cuenta.
- **PostHog:** también hay `npx @posthog/wizard mcp add` y el plugin `claude plugin install posthog`; con el comando
  de arriba basta.
- **Playwright** la primera vez descarga el navegador (tarda un poco). Si no tiene Node: `brew install node` (pide
  permiso).

## Paso 2. Si un cliente no deja entrar con el navegador (solo entonces)

Que cree la clave en la web del servicio y la guarde **él, en su Terminal**, no en el chat:

```bash
echo 'export PERPLEXITY_API_KEY="pega-aquí-tu-clave"' >> ~/.zshrc   # lo escribe él
```

Y tú añades la versión local leyendo la variable, sin verla nunca:

```bash
claude mcp add perplexity -s user --env 'PERPLEXITY_API_KEY=${PERPLEXITY_API_KEY}' -- npx -y @perplexity-ai/mcp-server
```

Lo mismo con Firecrawl (`FIRECRAWL_API_KEY`, paquete `firecrawl-mcp`). Nunca escribas la clave en un comando, un
archivo del proyecto ni un commit: acaba en el historial y en `~/.claude.json`.

## Paso 3. En claude.ai (web, escritorio y móvil)

En claude.ai: **Configuración → Conectores**. Firecrawl tiene conector en el directorio de Claude; para Composio,
Perplexity y PostHog: **Añadir conector personalizado**, con el nombre y la URL de la tabla, y entrar con su cuenta.
Playwright no va en claude.ai: corre en el ordenador, solo en Claude Code o en la app de escritorio.

## Paso 4. Probar cada uno

Con `/mcp` todos en «connected». Luego una prueba corta y real por conector, enseñándole el resultado:

- **Composio:** «¿Qué apps tengo conectadas en Composio?» y, si quiere, que conecte Gmail y le lea el asunto de su
  último correo.
- **Firecrawl:** leer la página de inicio de su web y resumirla en 3 líneas.
- **Perplexity:** una pregunta de actualidad de su sector, con fuentes.
- **Playwright:** abrir su web y sacar una captura.
- **PostHog:** visitas de la última semana (si tiene proyecto en PostHog).

Si uno falla: `/mcp` → reconectar; comprobar que el navegador terminó el inicio de sesión; `claude mcp list` para ver
el estado. Si sigue, sáltalo y sigue con los demás.

## Al terminar

Tabla corta: conector, conectado sí o no, cómo entró (cuenta o sin cuenta), coste y una frase de algo útil que ya le
puede pedir a cada uno. Recuérdale: puede ver y quitar permisos en la web de cada servicio y quitar un conector con
`claude mcp remove <nombre> -s user`.

## Reglas

- Ninguna clave en el chat, en archivos del proyecto ni en commits.
- No borres ni cambies conectores que ya tenga.
- No inventes precios ni funciones: lo de la tabla está comprobado a fecha de `PROBADO.md`; si algo cambió, dilo.
- Composio y Playwright pueden actuar en su nombre (mandar correos, hacer clics): antes de una acción que no se puede
  deshacer, pregúntale.
