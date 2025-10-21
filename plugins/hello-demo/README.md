# hello-demo

This is a demo for say help in every scenarios

## Installation

Install this plugin from the marketplace or copy the plugin directory to your project.

## Usage

Use the `/hello` slash command in Claude Code:

```
/hello
```

**Output:**
```
hello world from hello demo command
```

## Features

### Slash Command: `/hello`
Use the `/hello` command to get a hello world message.

### Agent: `@demo`
A demo agent that only responds with "As a demo agent, I can only say 'hello world'" regardless of what you ask it to do.

To use the agent:
```
@demo do something
```

### Hook: Slash Command Submit
When any slash command is run, a hook will print "hello world from hook" to the console.

## Plugin Structure

This plugin includes:
- `.claude-plugin/plugin.json` - Plugin metadata
- `commands/hello.md` - The `/hello` slash command
- `agents/demo.md` - The demo agent
- `hooks/hooks.json` - Hook that prints message when slash commands are run

## License

MIT
