# hello-demo

This is a demo for say help in every scenarios

## Installation

Copy the `.claude/commands/hello.md` file to your project's `.claude/commands/` directory:

```bash
cp plugins/custom/hello-demo/.claude/commands/hello.md .claude/commands/
```

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

## Configuration

This plugin includes:
- `.claude/commands/hello.md` - The `/hello` slash command definition
- `.claude/agents/demo.md` - The demo agent definition

## License

MIT
