#!/usr/bin/env sh
# Junta os pedaços de uma imagem partida e confere a soma.
#
#   ./juntar.sh NeovanguardOS-Install-1.0.0-x86_64.iso
#
# As imagens grandes vêm partidas porque um anexo de release do GitHub tem teto
# de 2 GiB. O `sha256` publicado é o da imagem **inteira**: é ele que prova que
# a remontagem deu certo, e é o arquivo remontado que vai para o pendrive.
set -eu

iso="${1:?diga o nome da imagem, sem o .part}"

if [ ! -f "$iso" ]; then
  set -- "$iso".*.part
  [ -f "$1" ] || { echo "não achei nem $iso nem os pedaços dele" >&2; exit 1; }
  echo "juntando $# pedaços…"
  cat "$iso".*.part > "$iso"
fi

if [ -f "$iso.sha256" ]; then
  sha256sum -c "$iso.sha256"
  echo "pode gravar."
else
  echo "sem $iso.sha256 aqui — baixe-o e rode: sha256sum -c $iso.sha256" >&2
fi
