# MiMaMa – Einstieg für jede Session

Antworten auf Deutsch, knapp, Aktion zuerst.

## Was das ist

Repo der Mikro-Makro-Maschine (MiMaMa), Vor-Linse der Probatio-Familie, als Claude-Code-Subagent. Autor der Fachlogik: Tobias Yoka Dietz. Siehe `README.md`.

## Dateien

| Pfad | Inhalt |
|---|---|
| `agent/mimama.md` | maßgebliche Fassung des Agenten |
| `scripts/check.ps1` | statische Prüfung: Frontmatter, Pflichtabschnitte, Version, CHANGELOG, BOM/CR, Deploy-Stand |
| `scripts/deploy.ps1` | prüft und kopiert nach `~/.claude/agents/mimama.md` |
| `docs/` | Entscheidungen (`DEC_*.md`), Lauf-Protokolle |
| `CHANGELOG.md` | Versionen von `agent/mimama.md` |

## Grundregeln

- `~/.claude/agents/mimama.md` nie direkt bearbeiten. Nur `agent/mimama.md` ändern, dann `scripts/check.ps1`, dann `scripts/deploy.ps1`.
- Jede Änderung an `agent/mimama.md`: Version erhöhen, CHANGELOG-Eintrag im selben Commit.
- Skripte nur ASCII (PowerShell 5.1). Dateien UTF-8 ohne BOM, LF (`.gitattributes`).
- Repo liegt auf exFAT: `safe.directory` muss global gesetzt sein.
- Inhaltliche Grenzen von v1.x (keine Holistik-Ebenen, kein Verdict) sind bewusst; Änderungen daran als Decision-Datei in `docs/` festhalten.
- Was in Plan, Decisions oder Memory steht, nicht erneut fragen.
