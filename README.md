# Wizeprep Study

Wizeprep Study connects your Wizeprep account to your AI app. See today’s study tasks, find courses you’re enrolled in, and review lesson notes and transcripts when your course access includes them. Practice with a question from your private study materials or an accessible standalone Wizeprep question. You can also review flash cards from your Wizeprep decks and save your ratings.

This package is a draft for the first release. The steps below use the production address and require Wizeprep to have opened access to your account.

## Connect your account

You need a Wizeprep student account and a host that supports custom MCP connections. Use this server address in each host.

```text
https://www.wizeprep.com/v2/mcp
```

### Claude

1. On Claude web or desktop, open **Customize → Connectors → Add → Add custom connector**. On Team or Enterprise, an authorized admin or owner first adds the connector under **Organization settings → Connectors**.
2. Name it **Wizeprep Study**, paste the server address, and select **Sign in now → Register automatically** for OAuth.
3. Select **Connect**, sign in on Wizeprep, and review the permissions before you approve. Enable the connector in your chat. [Claude custom connector guide](https://claude.com/docs/connectors/custom/add-unlisted)

### ChatGPT

1. On ChatGPT web, open **Plugins → + → Add custom MCP server**. If the option is missing, check your plan and workspace permissions.
2. Enter **Wizeprep Study** and the server address. Choose OAuth with dynamic client registration (DCR), then select **Create as a plugin**.
3. Install it, sign in on Wizeprep when prompted, and approve the permissions you want to grant. In a new chat, type `@` and select **Wizeprep Study**. Some ChatGPT plans support only read-only custom connections. [ChatGPT custom MCP guide](https://developers.openai.com/plugins/deploy/connect-chatgpt)

### Codex CLI

```sh
codex mcp add wizeprep-study --url https://www.wizeprep.com/v2/mcp
codex mcp login wizeprep-study
```

Run the second command if the first hasn’t already signed you in. Review permissions in the Wizeprep sign-in flow. Use `codex mcp list` to check that the connection is configured. [Codex MCP guide](https://learn.chatgpt.com/docs/extend/mcp?surface=cli)

## Try asking

- “What’s on my Wizeprep study list today? Keep it to three priorities.”
- “Which Wizeprep courses can I open? Show the outline for the one I pick.”
- “Summarize the notes for the lesson I just picked. Include the Wizeprep lesson link.”
- “Give me one Wizeprep practice question I have access to. Wait for my answer before showing the explanation.”
- “Show my Wizeprep flash card decks. Let me choose one, then show me one card at a time.”

## What’s available in v1

- Course content follows your Wizeprep account access. Videos play on Wizeprep. Transcript availability depends on full lesson access and whether the lesson has captions.
- Study tasks and dated goals live in your private Wizeprep Study list. You can request a plan proposal and see the suggested changes. Applying or undoing a proposal is held in v1.
- Standalone course questions support practice and answer saving where your course allows it. Section practice is held. For course-wide history, progress, insights, or the course-wide review list, open the course player on Wizeprep.
- Going through a flash card’s front and back is separate from submitting a rating. Daily cards require an active Wizeprep schedule. You can also choose an available deck directly.
- Wizeprep Study is for learning and exam preparation. Use your course materials to verify explanations. Keep live exam questions, symptoms, medical records, and other sensitive personal information out of prompts and notes.

## Age, privacy, and support

Wizeprep Study is for students aged 13 and older. Claude.ai requires users to be 18 or older. ChatGPT requires users to meet its minimum age in their country and to have permission from a parent or legal guardian if they’re under 18. [Claude age policy](https://www.anthropic.com/transparency/voluntary-commitments), [OpenAI Terms of Use](https://openai.com/policies/terms-of-use/)

Your AI app receives the study content returned by tools you authorize. Removing the connection stops future access through it. Use your AI app’s privacy controls for copies already shared there. [Wizeprep Study privacy notice](https://www.wizeprep.com/v2/mcp/privacy), [Wizeprep Study terms](https://www.wizeprep.com/v2/mcp/terms), [Wizeprep contact page](https://www.wizeprep.com/call-us)

## Troubleshooting

| What you see | What to try |
| --- | --- |
| Custom connection option is missing | Check your host’s plan or ask your workspace admin to enable custom MCP connections. |
| The connection won’t finish or has expired | Check the server address, then reconnect and sign in to the correct Wizeprep student account. If Wizeprep shows an invitation requirement, contact Wizeprep support. |
| A course, lesson or transcript is missing | Check your enrollment and lesson access in Wizeprep. Ask the AI app to list your enrolled courses again, then choose the course by name. |
| A write is unavailable | Check the permissions you approved and whether your host supports writes. For held course features, use the Wizeprep course player. |
| An answer or rating save is uncertain | Check the course player or flash card deck for the result before trying again. |
| An interactive card doesn’t appear | Ask for the result in text, or open the Wizeprep link in the response. |

## Build the directory ZIP

With the package files committed, run `./scripts/build-zip.sh` from the checkout. It archives `HEAD` by default and also accepts a commit, branch, or tag. The output is `wizeprep-study.zip`. It contains the manifests, icon, and this README.

The MCP manifest declares OAuth with dynamic client registration using OpenAI’s documented server extension. The Agent Plugins 1.0.0 base MCP schema rejects per-server extensions. For clients that enforce the base schema, use the custom connection steps above. [OpenAI MCP package authentication](https://developers.openai.com/plugins/build/plugins#configure-mcp-authentication), [Agent Plugins MCP schema](https://agent-plugins.org/schemas/1.0.0/mcp.schema.json)
