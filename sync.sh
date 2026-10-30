#!/bin/sh
# Übernimmt die Rechtstexte aus der App (Quelle: Handvoll/Handvoll/Resources/*.md).
# Danach prüfen, committen und pushen – GitHub Pages baut die Seite selbst.
set -e
SRC="$(dirname "$0")/../Handvoll/Handvoll/Handvoll/Resources"
cd "$(dirname "$0")"

{ printf -- '---\nlayout: default\ntitle: Datenschutzerklärung\n---\n\n'
  cat "$SRC/datenschutz.md"
  printf '\n## Hinweis zu dieser Webseite\n\nDiese Seite wird über GitHub Pages (GitHub, Inc., USA) bereitgestellt. Beim Aufruf verarbeitet GitHub technisch notwendige Daten wie deine IP-Adresse, um die Seite auszuliefern und vor Missbrauch zu schützen (Art. 6 Abs. 1 lit. f DSGVO). Diese Seite setzt keine Cookies und verwendet kein Tracking.\n'
} > datenschutz.md

{ printf -- '---\nlayout: default\ntitle: Impressum\n---\n\n'
  cat "$SRC/impressum.md"
} > impressum.md

printf -- '---\nlayout: default\ntitle: Handvoll\n---\n\nEine Handvoll Minuten für dich.\n' > index.md
