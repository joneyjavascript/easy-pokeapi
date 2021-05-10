# EASY PokeAPI

![image](https://user-images.githubusercontent.com/2818123/117732729-bef06a80-b1c6-11eb-9f96-d6ceca349765.png)

## TESTES

+ rails test

## PERFOMANCE 

Possíveis soluções para problemas de performance no nosso middleware para PokeApi

+ CACHE
  + Realizar cache da resposta da PokeAPI processada pela action Pokemon#abilities
  + Pensar nas regras de cache, validar se as informações cacheadas não são sensíveis ou se alteram com regularidade
+ THREADS
  + Realizar as requisições a PokeApi de forma paralela para normalizar o tempo de repostas das requisições.
  + É preciso verificar a capacidade de execução de multiplas threads no ambiente comfigurado e subir verificar se os recursos de processamento atendem esses multiplos processos paralelos.
+ TABELA COM CÓPIA DOS DADOS
  + Criar um Job para diariamente em um momento que não seja de pico para API OU utilizando recursos dedicados para extrair, processar e armazenar os dados da PokeApi que são relevantes pra aplicação em uma tabela
  + Será possível criar um ActiveRecord pra tabela pokemon_abilities e usar recursos do próprio Rails pra trabalhar com esses dados processados de forma mais agil, simples e dinâmica.
+ REFACTORING
  + Depois de escrever os testes, refatorar o código pensando em performance na extração dos dados da API.
