# AmigoSecreto
Um programa bem simples de sorteio de amigo secreto.

Ele sorteia nomes de maneira a evitar ciclos (ex. A pega B, B pega A) e o primeiro a revelar o presente garantidamente será o último a receber.

Requerimentos
-------------
O programa precisa de `perl` 5 e o utilitário `mail` (`sendmail`, `s-nail`...), o que significa que na maioria da versões do Linux e Mac OS, deve funcionar sem precisar instalar nada. Porém é necessário 
configurar o `mail`.

No Windows, é necessário instalar o `perl` e o `sendmail`.

Uso
---
Basta executar o programa em um terminal, passando uma lista de nomes:

    perl sorteio.perl nomes

Isso é o suficiente para enviar os emails com o resultado do sorteio.
Após realizado o sorteio, a semente aletória usada será exibida. Você pode usar essa semente para repetir o sorteio (caso, por exemplo, alguém perca o email) com a opção:

    perl sorteio.perl -r <semente> nomes

Finalmente, também é possível rodar um teste, sem enviar email com a opção `-t`.

Arquivo de nomes
----------------
Os nomes devem ser escritos um por linha, seguido de um email na linha abaixo. Veja o arquivo `nome` para um exemplo
