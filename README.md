# Ruby Duo --- Plataforma de estudo estilo Duolingo

Uma aplicação inspirada no Duolingo, focada em ensinar Ruby de forma
interativa.\
Backend desenvolvido em Ruby on Rails e frontend em Next.js.

------------------------------------------------------------------------

## Tecnologias

-   Ruby on Rails 7
-   PostgreSQL
-   Next.js (Frontend separado)

------------------------------------------------------------------------

## Como rodar o projeto

### 1. Clone o repositório

``` bash
git clone https://github.com/caroline-medeiros/ruby_duo.git
cd ruby_duo
```

### 2. Instale as dependências

``` bash
bundle install
```

### 3. Configure o banco de dados

Certifique-se de que o Postgres está rodando.

``` bash
rails db:create
rails db:migrate
```

### 4. Popule o banco (seed)

``` bash
rails db:seed
```

### 5. Inicie o servidor

``` bash
rails s
```

O servidor estará disponível em:

http://localhost:3000

------------------------------------------------------------------------

## Endpoints da API

A API segue o padrão REST.

### GET /lessons

Retorna todas as lições disponíveis.

### GET /lessons/:id

Retorna uma lição específica com suas perguntas e opções.

#### Exemplo de resposta

``` json
{
  "id": 1,
  "title": "Ruby Básico",
  "questions": [
    {
      "id": 1,
      "body": "Como imprimir no console?",
      "options": []
    }
  ]
}
```

------------------------------------------------------------------------

## Frontend

O frontend do projeto foi desenvolvido em Next.js.\
Repositório: *adicione o link aqui*

------------------------------------------------------------------------

## Desenvolvido por

Caroline Medeiros