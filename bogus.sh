#!/bin/bash

# verifica_ip HOST IP DNS
# Intoarce 0 daca IP-ul din /etc/hosts corespunde cu cel obtinut de la serverul DNS,
# 1 in caz contrar.
verifica_ip() {
  local nume="$1" adresa="$2" server_dns="$3" adresa_dns

  adresa_dns=$(dig +short @"$server_dns" "$nume" | head -n 1)
  [[ "$adresa" == "$adresa_dns" ]]
}

# Serverul DNS folosit: primul argument al scriptului, implicit 8.8.8.8
DNS="${1:-8.8.8.8}"

cat /etc/hosts | while read -r adresa nume _; do
  [[ $adresa == [0-9]* ]] || continue
  [[ $adresa == 127.* ]] && continue

  verifica_ip "$nume" "$adresa" "$DNS" || echo "Bogus IP for $nume in /etc/hosts!"
done
