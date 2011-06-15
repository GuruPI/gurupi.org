# Gurupi.org

Grupo de Usuários de Ruby do Piauí

## Primeiros Passos

Crie um clone do projeto

    $ git clone git://github.com/GuruPI/gurupi.org.git
    $ cd gurupi.org

Crie um arquivo de configuração para os bancos de dados (você pode copiar o exemplo que está no projeto):

    $ cp config/database.yml.example config/database.yml

Instale a **gem bundler**, caso ainda não tenha instalado, e chame o comando `bundle install` para instalar todas as dependências do projeto:

    $ gem install bundler
    $ bundle install

Você precisa rodar as migrations pra preparar o banco de dados do projeto

    $ rake db:migrate

Agora é só iniciar sua aplicação Rails

    $ rails server

Aponte seu browser para http://localhost:3000 e divirta-se ;)

## Como Testar

Prepare o Banco de Dados no ambiente de Testes

    $ rake db:prepare:test

ou

    $ rake db:migration RAILS_ENV=test

Daí por diante você só precisa executar o comando `guard`.

    $ guard

Toda vez que você salvar um arquivo importante, o Guard irá executar seus testes automaticamente.

## Como contribuir

* Faça um fork do projeto
* Faça as alterações com os respectivos testes (Este projeto utiliza o RSpec)
* Para fazer com seus testes executem automaticamente a cada alteração de arquivo, execute o guard na linha de comando
* Faça um pull request
* Código sem testes serão mais difíceis de ser aceitos ;)