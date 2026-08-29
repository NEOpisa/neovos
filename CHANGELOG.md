# Neovanguard OS 1.0.0

Três imagens, e cada uma serve uma pessoa diferente.

| | o que é | tamanho |
|---|---|---|
| **MYO** — `NeovanguardOS-MYO-1.0.0-x86_64.iso` | Monte o seu. Dá boot num terminal e pergunta tudo: ambiente gráfico (ou nenhum), disco, formato, kernel, carregador de boot, vídeo, programas, a camada de soberania módulo a módulo. Instala pela rede. | ~0,5 GB |
| **Live** — `NeovanguardOS-Live-1.0.0-x86_64.iso` | O sistema pronto, para experimentar sem instalar nada. **Não tem instalador**, de propósito. | ~3,5 GB |
| **Install** — `NeovanguardOS-Install-1.0.0-x86_64.iso` | O sistema pronto, para instalar. Dá boot num terminal e desdobra no disco o sistema que viaja dentro da própria imagem — **sem internet**. | ~3,7 GB |

Se você não sabe qual escolher: **Install**.

## Antes de gravar

As duas imagens grandes vêm partidas, porque o GitHub não aceita anexo de release
maior que 2 GiB. Junte antes de gravar:

    cat NeovanguardOS-Install-1.0.0-x86_64.iso.*.part > NeovanguardOS-Install-1.0.0-x86_64.iso
    sha256sum -c NeovanguardOS-Install-1.0.0-x86_64.iso.sha256

O `sha256` publicado é o da imagem inteira, remontada — que é o arquivo que vai
para o pendrive, e portanto o que interessa conferir.

## O menu de boot

Cada imagem tem uma entrada principal e uma com leitor de tela. A **Live** tem
mais duas:

- **para pendrive lento** — carrega o sistema inteiro na RAM antes de começar.
  Leva alguns minutos e depois fica rápido para sempre. Precisa de ~5 GiB de RAM
  livre.
- **Vault** — tudo na RAM, sem rede e sem disco montado, para assinar transação
  de valor.

## Corrigido nesta versão

- **A instalação falhava com "Configuração incorreta do unpackfs".** A causa era
  a mídia se copiar para a RAM sem ninguém pedir: o padrão do archiso liga a
  cópia sozinho num pendrive, e ao copiar ele apaga o ponto de montagem de onde o
  instalador ia ler. Agora toda entrada de boot diz explicitamente se copia ou
  não, e o instalador sabe achar a mídia pelo rótulo mesmo quando o ponto de
  montagem some.
- **Duas entradas "Instalar o Neovanguard OS" no menu**, uma delas apontando para
  um programa que não existia mais.
- A mídia carregava três kernels e só sabia dar boot em um — ~500 MB de peso
  morto, três vezes.
