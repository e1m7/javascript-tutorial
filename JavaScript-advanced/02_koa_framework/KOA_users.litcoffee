
Простое веб-приложение с API
============================

1) Устанавливаем все библиотеки

>>> npm init
>>> npm i koa koa-router koa-ejs axios path

2) Создаем index.js

    const Koa = require("koa");
    const KoaRouter = require("koa-router");
    const path = require("path");
    const render = require("koa-ejs");
    const axios = require("axios");

    const app = new Koa();
    const router = new KoaRouter();
    const PORT = 3000;

    render(app, {
        root: path.join(__dirname, "views"),
        layout: "index",
        viewExt: "html",
    });

    router.get("/", async (ctx) => {
        const result = await axios.get("https://randomuser.me/api?results=5");
        return ctx.render("index", {
            users: result.data.results,
        });
    });

    app.use(router.routes());
    app.use(router.allowedMethods());

    app.listen(PORT, () => console.log(`Start ${PORT}...`));

3) Cоздаем каталог `viwes`

4) Создаем внутри него файл `index.html`

<html>
  <head>
    <title>First Steps with Koa</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
  </head>
  
  <body>
    <div class="container">

    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Koa.js</h1>
        <p class="lead">App User <a href="https://randomuser.me/">randomuser.me</a>
    </div>

    <div class="list-group">
      <% users.forEach( function(user) { %>
    
      <div class="list-group-item">

        <div class="d-flex w-100 justify-content-between">
          <h5 class="mb-1">
            <%= user.name.title %> 
            <%= user.name.first %> 
            <%= user.name.last %>
          </h5>
          
          <small>Registered at: <%= user.registered.date %></small>
        </div>

          <p class="mb-1"><strong>Address:</strong>
            <%= user.location.street.number %> 
            <%= user.location.street.name %>
            <%= user.location.city %> 
            <%= user.location.postcode %> 
            <%= user.location.country %>

          <small>Phone: <%= user.phone %></small>

      </div>
      <% }); %>

            </div>
        </div>
    </body>
</html>

5) Установим библиотеку Logger

>>> nim i koa-logger

6) Добавим код перед запуском сервера

    app.use(Logger())
      .use(router.routes())
      .use(router.allowedMethods());

    router.get("/", async (ctx) => {
      const result = await axios.get("https://randomuser.me/api?results=5");
      return ctx.render("index", {
        users: result.data.results,
      });
    });

7) Убедимся, что логирование запросов происходит

>>> node index


Задание по лекции
=================

  1) Сделать вывод фотографий пользователей
  2) Оформить страницу как таблицу
    а) фото
    б) информация