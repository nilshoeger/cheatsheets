# cheatsheet

Farbige Kurzreferenzen im Terminal. Aufruf per `cheatsheet <thema>`.

## Verfügbare Themen

| Thema      | Inhalt                                            |
|------------|---------------------------------------------------|
| `vim`      | Vim – Editor                                      |
| `tmux`     | tmux – Terminal-Multiplexer                       |
| `ros2`     | ROS 2 – Robot Operating System                    |
| `git`      | git – Versionsverwaltung                          |
| `nginx`    | nginx – Webserver & Reverse Proxy                 |
| `users`    | Linux (Ubuntu) – Benutzer- & Gruppenverwaltung    |
| `docker`   | Docker – Container, Images & Compose              |
| `dotnet`   | dotnet – .NET (Core) CLI                          |
| `chmod`    | chmod – Dateirechte ändern                        |
| `groups`   | Linux – Gruppen verwalten                         |
| `sysadmin` | Linux – Sysadmin: System, Dienste, Netzwerk, Logs |
| `mysql`    | MySQL – Administration                            |

## Verwendung

```bash
cheatsheet              # Liste aller Themen
cheatsheet vim          # komplettes Cheatsheet
cheatsheet tmux pane    # nur Einträge, die zu "pane" passen
cheatsheet ros2 bag     # Suche in Befehlen, Beschreibungen und Sektionsnamen
cheatsheet docker logs  # z. B. alle Log-Befehle von Docker
cheatsheet --update     # neue Cheatsheets aus dem Git-Repo holen
```

- Die Suche ignoriert Groß-/Kleinschreibung und durchsucht Befehle, Beschreibungen und Sektionsnamen.
- Lange Ausgaben laufen automatisch durch `less`. Mit `PAGER` lässt sich ein anderer Pager setzen.
- `NO_COLOR=1 cheatsheet vim` schaltet die Farben ab. Beim Umleiten in eine Datei oder Pipe sind sie automatisch aus.

## Aktualisieren

```bash
cheatsheet --update     # oder -u: holt neue Commits per git pull --ff-only
```

Zeigt die neuen Commits an. Bei lokalen Änderungen oder nicht fast-forward-fähigem Verlauf bricht das Update mit einer Meldung ab.

## Installation

```bash
./install.sh                  # Symlink nach ~/.local/bin/cheatsheet
./install.sh ~/bin            # anderes Zielverzeichnis
./install.sh --uninstall      # Symlink wieder entfernen
```

Das Zielverzeichnis muss im `PATH` liegen, sonst gibt das Skript einen Hinweis aus. Das Skript `cheatsheet` findet seine Themen über den echten Pfad, der Symlink genügt also.

## Aufbau

```
cheatsheets/
├── cheatsheet          # Skript (Bash)
├── install.sh          # Installer (Symlink in den PATH)
├── README.md
├── chmod/cheatsheet.txt
├── docker/cheatsheet.txt
├── dotnet/cheatsheet.txt
├── git/cheatsheet.txt
├── groups/cheatsheet.txt
├── mysql/cheatsheet.txt
├── nginx/cheatsheet.txt
├── ros2/cheatsheet.txt
├── sysadmin/cheatsheet.txt
├── tmux/cheatsheet.txt
├── users/cheatsheet.txt
└── vim/cheatsheet.txt
```

## Neues Thema hinzufügen

1. Ordner anlegen, z. B. `git/`.
2. Darin eine `cheatsheet.txt` erstellen. Das Skript muss nicht geändert werden, das Thema erscheint sofort in der Liste.

### Dateiformat

```
@ Titel des Cheatsheets
## Sektion
befehl oder taste | Beschreibung
weiterer befehl | Beschreibung
## Nächste Sektion
...
```

- `@ ` – Titel (eine Zeile pro Datei).
- `## ` – Sektionsüberschrift.
- `links | rechts` – ein Eintrag. Das Trennzeichen ist ` | ` mit Leerzeichen, ein einzelnes `|` im Befehl (z. B. `grep | sort`) ist daher erlaubt, solange es nicht von Leerzeichen umgeben ist. Der Befehl darf selbst kein ` | ` enthalten.
