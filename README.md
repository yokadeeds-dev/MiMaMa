# MiMaMa – Mikro-Makro-Maschine

Multi-Skalen-Vor-Linse der Probatio-Familie, als Claude-Code-Subagent (nur lesend: Read, Grep, Glob). Liefert Skalen-Karte (Nano · Mikro · Meso · Makro · Meta), Perspektiven und eine PASS/FAIL-Vorentscheidung. **Kein Verdict, kein Score.** Seit v1.1 mit Quellen-Bindungs-Gate (C_ext).

Handle ist **MiMaMa**, nicht „MMM" (so heißt der modulinterne Matching-Check in den ESG-eingereichten PS-Modulen).

## Benutzung

```powershell
.\scripts\check.ps1    # statische Prüfung
.\scripts\deploy.ps1   # nach ~/.claude/agents/mimama.md kopieren
```

Befehle: `MiMa:AN` · `FULL` · `LITE` · `PERSP` · `DOWN` · `UP` · `PREMISE` · `VERIFY` · `EX` · `STATUS`.

Maßgebliche Fassung: `agent/mimama.md` (Anleitung und Spezifikation zugleich). Regeln: `CLAUDE.md`.

Abkömmling: [Probatio Technica](../Probatio-Technica) (PTc).
