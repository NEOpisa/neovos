# Neovanguard OS

Uma distribuição Arch para soberania: Bitcoin, Lightning, Liquid, eCash, Nostr,
Tor e endurecimento do sistema, com um ambiente Plasma feito por nós.

**Este repositório só publica as imagens.** O código-fonte — o instalador, o tema
Birfree, os 57 comandos `neo-*`, o perfil do archiso e a build — vive em
`neovosdev`.

## Qual imagem baixar

| | o que é | tamanho |
|---|---|---|
| **Install** | O sistema pronto, para instalar. Dá boot num terminal e desdobra no disco o sistema que viaja dentro da própria imagem — **sem internet**. | ~3,7 GB |
| **Live** | O mesmo sistema, para experimentar sem instalar nada. **Não tem instalador**, de propósito. | ~3,5 GB |
| **MYO** | *Make Your Own*. Dá boot num terminal e pergunta tudo: ambiente gráfico (ou nenhum), disco, formato, kernel, carregador de boot, vídeo, programas, a camada de soberania módulo a módulo. Instala pela rede. | ~0,5 GB |

**Se você não sabe qual escolher: Install.**

As três estão em [Releases](../../releases). Como gravar, e como conferir que o
download chegou inteiro, está em [`GRAVANDO.md`](GRAVANDO.md) — vale a pena ler
antes, porque as duas imagens grandes vêm partidas em pedaços.

## O que você recebe

- **Plasma com o tema Birfree**, uma barra no topo e uma dock embaixo, ícones e
  cursor Dracula, e um lançador em grade.
- **A camada de soberania**: 57 comandos `neo-*` para nó Bitcoin, Core Lightning,
  Liquid, mint Cashu, relay Nostr, Tor, mesh sem roteador, air-gap e Shamir.
- **Identidade Nostr desde a instalação**: doze palavras (NIP-06), chave cifrada
  por senha (NIP-49), e um cofre de configurações que você restaura numa máquina
  nova só com as doze palavras.
- **Modo Cold Vault**: o sistema inteiro na RAM, sem rede e sem disco montado,
  para assinar transação de valor.

## Licença

GPL-3.0-or-later. A marca e as logos identificam a distribuição: um fork deve
trocar nome e logo, como fazem Arch, Debian e Firefox.
