# Jogo da Forca em Bash

Este é um jogo da forca desenvolvido em Bash, onde o jogador tenta adivinhar uma palavra oculta por meio de tentativas de letras ou adivinhando a palavra completa.

### Como Jogar

1. **Execução do Jogo:**
   - Execute o script em um terminal Bash usando `./jogodaforca.sh`.
   - O jogo começará exibindo um layout inicial do boneco da forca.

2. **Regras do Jogo:**
   - O jogo seleciona aleatoriamente uma palavra para o jogador adivinhar.
   - O jogador tem um número limitado de tentativas para adivinhar a palavra ou as letras corretas.
  
3. **Desistir do Jogo:**
   - Se o jogador desejar desistir, basta digitar "DESISTO" quando solicitado a inserir uma letra.
   - Isso revelará a palavra e encerrará o jogo imediatamente.

4. **Entrada de Letras:**
   - O jogador é solicitado a inserir uma letra.
   - Se a letra estiver na palavra, ela é revelada; caso contrário, uma parte do boneco da forca é desenhada.

5. **Adivinhando a Palavra:**
   - O jogador também pode tentar adivinhar a palavra completa digitando "DESISTO".
   - Ao adivinhar incorretamente ou exceder o número de tentativas permitidas, o jogo é encerrado.

6. **Personalização:**
   - A palavra a ser adivinhada pode ser alterada editando a variável `PALAVRA` no código.
   - O layout do boneco pode ser personalizado editando as funções que desenham as diferentes partes do boneco.

### Funcionalidades Adicionais

- **Funções de Desenho:** São funções que desenham diferentes partes do boneco da forca conforme o jogador erra tentativas.
- **Loop Principal:** Controla o jogo, verificando as entradas do jogador, exibindo partes do boneco e terminando o jogo quando as condições são atendidas.

### Notas Finais

Este jogo da forca em Bash é uma implementação simples e pode ser expandido ou modificado conforme necessário.

Divirta-se jogando! 😊🎮
