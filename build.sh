#!/bin/bash

echo "Building Satzung"
pandoc -V geometry:"top=2cm, bottom=1.5cm, left=3cm, right=3cm" satzung.md -o satzung.pdf


echo "Building Beitragsordnung"
pandoc -V geometry:"top=2cm, bottom=1.5cm, left=3cm, right=3cm" beitragsordnung.md -o beitragsordnung.pdf


