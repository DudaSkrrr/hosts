#!/bin/bash

cat /etc/hosts | while read -r adresa nume _; do
  [[ $adresa == [0-9]* ]] || continue
  [[ $adresa == 127.* ]] && continue

  adresa_dns=$(dig +short "$nume" | head -n 1)
  ! [[ $adresa == "$adresa_dns" ]] || echo "Bogus IP for $nume in /etc/hosts!"
done
