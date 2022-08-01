**********************************************************************
  Pequenos passos para o ambiente de dev com PHP e Postgres no Nginx  
**********************************************************************

Esse ambiente pretende utilizar a porta 80, deve-se desabilitar qualquer serviço que utilize essa porta.

1. Criar o arquivo conf dentro de sites para cada app que teremos, podendo utilizar default.conf como base. (Utilizar o hostname para o nome do arquivo Ex.: app.exemplo.test.conf. E remover o default da porta de listen);
2. No arquivo criado no passo 1 o server_name deve ser o mesmo do hostname. O diretório root será o diretório do projeto (Passo 3);
3. Dentro da pasta www criar a pasta do projeto, com o nome do hostname. Essa será a pasta que abrigará a aplicação;
4. Alterar o proprietário da pasta (e conteúdo) do projeto para www-data;
5. Criar o host no /etc/hosts (lembrando que não aceita porta):
						127.0.0.1		app.exemplo.test
6. Alterar o usuário e id do usuário dos args no docker-compose.yml

No fim, o projeto ficará dentro da pasta www/meu_projeto