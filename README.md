
## Was hier drin steckt

### Codex CLI
- `config.toml`: meine persönliche Einstellungssammlung für die Codex CLI.

- `agents.md`: Template mit allen Regeln und Guardrails. Gerne könnt ihr euch hier das rauskopieren was für euch sinnvoll ist.

- `alias.md`: ein paar Shell-Aliasse, damit sich verschiedene Codex-Profile mit einem Kurzbefehl starten lassen.

- Skills: Codex nutzt den Skills-Standard für spezialisierte Abläufe. Hinweis: In meinem älteren YouTube-Video spreche ich noch über den `prompts/`-Ordner – Codex nutzt inzwischen Skills. Kurze Übersicht in den offiziellen Docs: `https://developers.openai.com/codex/skills`.

### Fish Shell
- `fish/functions/ga.fish`: Erstellt einen Clone für parallele Entwicklung. Nutzt `--reference` für schnelle, platzsparende Clones.
- `fish/functions/gd.fish`: Löscht einen Clone mit Sicherheitschecks (warnt bei uncommitted/unpushed changes).

**Abhängigkeiten:** `brew install fzf gum`

**Installation:**
```fish
cp fish/functions/*.fish ~/.config/fish/functions/
```

**Nutzung:**
```fish
cd ~/mein-projekt
ga feature-name    # erstellt ../mein-projekt-feature-name auf branch agent/feature-name

cd ../mein-projekt-feature-name
gd                 # löscht den Clone (mit Bestätigung)
```

Ideal für Multi-Agent-Workflows wo mehrere AI-Agents parallel arbeiten sollen.

## Nutzung
* Nicht einfach kopieren, schau dir die Konfigurationsfiles genau an, versteh sie, und nimm dir daraus nur das, was für dich Sinn macht. *
  
- Platziere die `config.toml` nach `~/.codex` (oder dorthin, wo deine CLI nach Configs liegt).

- Ich nutze inzwischen meistens `--yolo`, aber die Guardrails in diesem Repo sind ein guter Startpunkt.

- Führe die alias.md Befehle aus, und speichere sie für deine Shell. Falls du dir da unsicher bist wie das geht einfach die AI deiner Wahl fragen ;)

- Agents.md gehört in jedes neue Projekt, oder wenn ihr schon ein Projekt habt mit einer Agents.md dann dort anhängen
