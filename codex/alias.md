Diese Aliases erleichtern die Arbeit mit der Codex CLI.  
### Für schnelle Änderungen
```bash
alias codexf="codex --profile fast -a on-failure -s workspace-write"
```

### Default zum Entwickeln
```bash
alias codexd="codex --profile default -a on-failure -s workspace-write"
```

### Default mit Chrome DevTools MCP
```bash
alias codexc="codexd -c mcp_servers.chrome-devtools.enabled=true"
```
### Alias speichern
```bash
source ~/.config/fish/config.fish
```
