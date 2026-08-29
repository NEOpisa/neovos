# Gravando o pendrive

## 1. Junte os pedaços

A **Install** e a **Live** vêm partidas. Não é capricho: um anexo de release do
GitHub tem teto de 2 GiB, e as duas passam disso.

```sh
./juntar.sh NeovanguardOS-Install-1.0.0-x86_64.iso
```

Ou à mão, que é a mesma coisa em uma linha:

```sh
cat NeovanguardOS-Install-1.0.0-x86_64.iso.*.part > NeovanguardOS-Install-1.0.0-x86_64.iso
```

A **MYO** cabe inteira e não precisa disto.

## 2. Confira

```sh
sha256sum -c NeovanguardOS-Install-1.0.0-x86_64.iso.sha256
```

O número publicado é o da **imagem inteira, já remontada** — que é o arquivo que
vai para o pendrive, e portanto o que interessa conferir. Se ele não bater, não
grave: um pedaço veio truncado, e você descobriria isso no meio da instalação.

## 3. Grave

```sh
sudo dd if=NeovanguardOS-Install-1.0.0-x86_64.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

Troque `/dev/sdX` pelo pendrive — **sem número no fim**: é o disco, não a
partição. `lsblk` mostra qual é; confira o tamanho antes de apertar enter.

No Windows, o [Rufus](https://rufus.ie) em modo "DD Image" faz o mesmo.

### Ventoy

Funciona: copie a `.iso` para a partição do Ventoy e escolha no menu dele. As
imagens passam os parâmetros de boot certos para esse caminho — foi um dos
lugares onde a 1.0.0 quebrou, e agora tem verificação de build que impede.

**O que não funciona é copiar a `.iso` para dentro de um pendrive comum.** A
imagem precisa ser *gravada* no dispositivo, não colocada dentro dele: é a
gravação que põe o rótulo de volume que o instalador usa para se achar.

## 4. Boot

Desligue o Secure Boot, ou use a MYO e ligue-o depois com o `neo-secureboot` —
as imagens não vêm assinadas por chave da Microsoft.

O menu tem uma entrada principal e uma com leitor de tela. A **Live** tem mais
duas:

- **para pendrive lento** — carrega o sistema inteiro na RAM antes de começar.
  Leva alguns minutos, mostra a barra de progresso, e depois fica rápido para
  sempre. Precisa de ~5 GiB de RAM livre. Use se a área de trabalho estiver
  engasgando.
- **Vault** — tudo na RAM, sem rede e sem disco montado.

## Se der errado

**"O sistema de arquivos de origem … não existe"** — se você vir isto, é uma
imagem da 1.0.0 antiga. Baixe de novo.

**A instalação não acha o sistema a instalar** — a mensagem diz o que fazer. Na
maioria das vezes é a imagem ter sido copiada para o pendrive em vez de gravada,
e a solução é gravar. Nada é escrito no disco antes dessa verificação.
