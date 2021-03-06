# GetOnRails
Olá! Esse é um projeto com finalidade de aprendizado do framework Ruby on Rails. O objetivo é oferecer uma aplicação já funcionando que deve ser modificada de maneira incremental através dos tutoriais e validada com os testes já implementados. Veja nossa [wiki](https://github.com/ruby-joinville/get-on-rails/wiki) para mais detalhes.

### Requerimentos para subir a aplicação
 - ruby na versão `2.5.1` (sugerimos usar o [rvm](https://rvm.io/rvm/install))
 - [docker-compose](https://docs.docker.com/compose/install/) na versão `1.21.2`

## Desenvolvimento

### Rode o banco de dados

```sh
docker-compose up --build
```

### Configure e instale as dependências da aplicação

```sh
cp config/database.sample.yml config/database.yml
```

```sh
bundle install
```

```sh
rails db:setup
```
