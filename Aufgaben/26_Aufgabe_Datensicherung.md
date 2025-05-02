# Datenbanksicherung – Einfach erklärt

## Warum Backups wichtig sind
- Datenbanken enthalten alle Infos für Websites und Firmen-Apps.
- Häufige Ursachen für Datenverlust: Technikfehler oder Bedienfehler, nicht Hacker.
- Ein Ausfall kann Daten oder Vertrauen kosten.

## Was ist ein Backup?
Ein **Backup** ist eine Kopie der Datenbank, mit der man den Zustand von früher wiederherstellen kann.

## Online- vs. Offline-Backup

| Typ       | Beschreibung                                 | Vorteile & Nachteile                             |
|-----------|----------------------------------------------|--------------------------------------------------|
| **Online**  | Datenbank läuft weiter, Änderungen werden mitgesichert | Kein Ausfall, aber technisch anspruchsvoller     |
| **Offline** | Datenbank wird dafür gestoppt              | Einfacher, aber nicht nutzbar während der Sicherung |

## Arten von Backups

| Art                  | Gesichert wird …                      | Speicherplatz | Zur Wiederherstellung nötig …            |
|----------------------|----------------------------------------|----------------|------------------------------------------|
| **Voll-Backup**      | Alles                                  | viel           | nur dieses Backup                        |
| **Differenziell**    | Änderungen seit dem letzten Vollbackup | mittel         | Vollbackup + dieses Backup               |
| **Inkrementell**     | Änderungen seit dem letzten Backup     | wenig          | Vollbackup + alle darauf folgenden Backups |

## Gute Backup-Gewohnheiten
- **Regelmäßig sichern** – Speicherplatz ist weniger wichtig als Sicherheit.
- **Außerhalb** des Hauptsystems aufbewahren (Brand/Diebstahl).
- **Verschlüsseln** nicht vergessen.
- Für logische Backups einen **eigenen DB-Nutzer** verwenden.

## Nützliche Werkzeuge

| Tool           | Beschreibung                                                |
|----------------|-------------------------------------------------------------|
| `mysqldump`    | Befehlszeile, schnell, manchmal vom Hoster gesperrt         |
| **phpMyAdmin** | Einfach per Browser, aber nur bis ca. 2 MB Datei-Upload     |
| **BigDump**    | Große Datenbank-Dateien wieder einspielen (kein Backup-Tool)|
| **HeidiSQL**   | Windows-Programm ohne PHP-Limit, aber keine Automatisierung |
| **Mariabackup**| Open Source, für laufende Backups auf Dateiebene geeignet   |

## Kurz gesagt
Datenbanken brauchen doppelten Schutz:  
1. **Vorbeugend** gegen Angriffe.  
2. **Nachträglich** durch zuverlässige und regelmäßige Backups.
