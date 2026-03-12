import { defineConfig } from "jsr:@yuki-yano/zeno";
import type { Snippet, UserCompletionSource } from "jsr:@yuki-yano/zeno";

export default defineConfig(async () => {
  const snippets: Snippet[] = [
    // Git
    {
      name: "git status",
      keyword: "gs",
      snippet: "git status --short --branch",
    },
    {
      name: "git add all",
      keyword: "ga",
      snippet: "git add .",
    },
    {
      name: "git commit",
      keyword: "gcm",
      snippet: "git commit -m '{{message}}'",
    },
    {
      name: "git log",
      keyword: "gl",
      snippet: "git log --oneline -20",
    },
    // nb
    {
      name: "Edit Note",
      keyword: "nbe",
      snippet: "nb edit",
    },
    {
      name: "List Note",
      keyword: "nbl",
      snippet: "nb ls --limit 20",
    },
    {
      name: "List All Note",
      keyword: "nbla",
      snippet: "nb ls --all",
    },
    {
      name: "nb search",
      keyword: "nbg",
      snippet: 'rg "{{keyword}}" "$(nb notebooks current --path)"',
    },
    {
      name: "ls -la",
      keyword: "ll",
      snippet: "ls -la",
    },
    {
      name: "ls -a",
      keyword: "la",
      snippet: "ls -a",
    },
    {
      name: "Reload zsh config",
      keyword: "so",
      snippet: "source ~/.zshrc",
    },
    {
      name: "Exit terminal",
      keyword: "qq",
      snippet: "exit",
    },
  ];

  const completions: UserCompletionSource[] = [
    {
      name: "nb edit",
      patterns: ["^nb e( .*)? $", "^nb edit( .*)? $"],
      sourceCommand: "nb ls --no-color | grep -E '^\\[[0-9]+\\]'",
      options: {
        "--ansi": true,
        "--prompt": "'nb edit >'",
        "--preview": "echo {} | sed -E 's/^\\[([0-9]+)\\].*/\\1/' | xargs nb show",
      },
      callback: "sed -E 's/^\\[([0-9]+)\\].*/\\1/'",
    },
    {
      name: "nb subcommands",
      patterns: ["^\\s*nb\\s*$", "^\\s*nb\\s+help\\s*$"],
      sourceCommand: "nb subcommands",
      options: {
        "--prompt": "'nb subcommand >'",
      },
    },
  ];

  return { snippets, completions };
});
