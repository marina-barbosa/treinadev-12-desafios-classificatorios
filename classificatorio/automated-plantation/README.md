# Plantações

Para agilizar o plantio, um fazendeiro começou a usar máquinas para plantar sementes e fertilizá-las em áreas
específicas de uma plantação de tamanho definido.

As instruções que as máquinas recebem contam com o tipo de semente ou
fertilizante, o ponto inicial de onde a máquina deve iniciar, seguido da
quantidade de linhas e colunas que devem ser preparados. Exemplo:

```
fertilizante/semente {*}
*:0,0:2x2
{}:1,1:2x2
```

As instruções começam com o tipo de combinação entre semente `*` e fertilizante `{ }`
que deveria ser entregue, neste caso `{*}`.
Cada instrução começa com um fertilizante ou semente, seguido pela posição inicial para
fertilização `0,0` e a quantidade de linhas e colunas `2x2` (a partir da posição inicial,
para a direita e para baixo). Para esse exemplo,
considerando uma plantação de tamanho `3x3` teríamos:

```
[["*", "*", " "],
 ["*", "*", " "],
 [" ", " ", " "]]
```

Depois de executar a instrução, a plantação teria 4 pontos com sementes
plantadas. Os pontos que não receberem sementes ou fertilizantes ficam com
espaços em branco.

Continuando a execução das instruções, o fertiizante `{}` é aplicado, resultando
no seguinte:

```
[["*", "*"  , " "],
 ["*", "{*}", "{}"],
 [" ", "{}" , "{}"]]
```

Nesta plantação, após a execução das instruções, apenas um ponto foi plantado e
fertilizado de acordo com a combinação esperada `{*}`.

No desafio, você deve implementar o código que recebe as instruções e o tamanho
da plantação, com o método `set_crop`, que retorna o mapa de como ficou a
plantação, e o método `healthy_crop`, que retorna quantos pontos foram plantados
e fertilizados com a combinação esperada.

**AVISO**

Esse desafio é parte de um processo seletivo da Campus Code e fica proibido o compartilhamento, incluindo, mas não se restringindo a:

- versionadores de código (como GitHub, GitLab, BitBucket e similares);
- grupos públicos como Telegram, Facebook e WhatsApp, entre outros;
- fóruns como StackOverflow e outros;
- bem como com outras pessoas participantes. 

Ao compartilhar o desafio, mesmo que parcialmente, ou divulgar sua solução para outras pessoas participantes, a Campus Code pode excluir você deste e de outros processos seletivos.
