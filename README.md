# configs

Meine persönlichen Konfigurationen für Dev-Tools.

## Struktur

```
configs/
├── codex/           # OpenAI Codex CLI
│   ├── config.toml  # CLI-Einstellungen
│   ├── agents.md    # Guardrails & Regeln
│   └── alias.md     # Shell-Aliasse
└── fish/            # Fish Shell
    └── functions/
        ├── ga.fish  # Git clone für parallele Entwicklung
        └── gd.fish  # Clone sicher löschen
```

---

## Codex CLI

- `codex/config.toml`: meine persönliche Einstellungssammlung für die Codex CLI.
- `codex/agents.md`: Template mit allen Regeln und Guardrails.
- `codex/alias.md`: Shell-Aliasse für verschiedene Codex-Profile.

**Installation:**
```bash
cp codex/config.toml ~/.codex/
```

Skills: Codex nutzt den Skills-Standard für spezialisierte Abläufe. Docs: https://developers.openai.com/codex/skills

---

## Fish Shell

### ga / gd - Parallele Git-Entwicklung

Funktionen für Multi-Agent-Workflows, wo mehrere AI-Agents gleichzeitig arbeiten.

- `ga <name>`: Erstellt einen Clone mit `--reference` (schnell, platzsparend)
- `gd`: Löscht Clone mit Sicherheitschecks (warnt bei uncommitted/unpushed)

**Abhängigkeiten:**
```bash
brew install fzf gum
```

**Installation:**
```fish
cp fish/functions/*.fish ~/.config/fish/functions/
```

**Nutzung:**
```fish
cd ~/mein-projekt
ga feature-name    # → ../mein-projekt-feature-name auf branch agent/feature-name

cd ../mein-projekt-feature-name
gd                 # → löscht den Clone (mit Bestätigung)
```

---

## Hinweis

Nicht einfach kopieren - schau dir die Files genau an und nimm nur das, was für dich Sinn macht.
