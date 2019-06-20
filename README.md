# GetOnRails
Olá! Essa é uma aplicação com finalidade de aprendizado do framework Ruby on Rails. O objetivo é oferecer uma aplicação já funcionando que deve ser modificada de maneira incremental e validada com os testes já implementados. Veja nossa [wiki](https://github.com/ruby-joinville/get-on-rails/wiki) para mais detalhes.

### Requerimentos para subir a aplicação
 - ruby na versão `2.5.1`

## Desenvolvimento

### Rode o banco de dados

```sh
docker-compose up --build
```

### Configure e instale as dependências do projeto

```sh
cp config/database.sample.yml config/database.yml
```

```sh
bundle install
```

```sh
rails db:setup
```
