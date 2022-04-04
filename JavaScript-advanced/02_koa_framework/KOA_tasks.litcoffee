
Простое веб-приложение
======================

1) Устанавливаем NodeJS

2) Устанавливаем NPM-manager

>>> node -v
>>> npm -v

4) Создаем каталог `koa-simple-app`

5) Создаем простой проект

>>> npm init -y

6) Устанавить библиотеку koa

7) Устанавить библиотеку nodemon

>>> npm i koa
>>> npm i nodemon

8) Создаем скрипт для запуска сервера `package.json`

    "start": "nodemon app.js"

9) Создаем файл `app.js`

    const Koa = require('koa');
    const app = new Koa();
    app.use(async ctx => ctx.body = "Hello World");
    app.listen(3000, () => console.log('Server start 3000...'));

10) Запускаем сервер

>>> npm start

11) Проверяем что она работает на localhost:3000

11) Передаем в теле не строку, а json-данные

    const Koa = require('koa');
    const app = new Koa();

    app.use(async ctx => ctx.body = {
      message: "Hello World"
    });

    app.listen(3000, () => console.log('Server start 3000...'));

12) Установить библиотеку koa-json

>>> npm i koa-json

13) Добавить обработку json в проект

    const Koa = require('koa');
    const json = require('koa-json');

    const app = new Koa();

    app.use(json());

    app.use(async ctx => ctx.body = {
      message: "Hello World"
    });

    app.listen(3000, () => console.log('Server start 3000...'));

14) Проверить, что обработка заработала (переносы строк)

15) Устанавить библиотеку роутеров

>>> npm i koa-router

    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');

    const app = new Koa();
    const router = new KoaRouter();

    app.use(json());

    app.use(async ctx => ctx.body = {
      message: "Hello World"
    });

    app.listen(3000, () => console.log('Server start 3000...'));

16) Подключить обработку роутеров (переходов) в приложении

    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');

    const app = new Koa();
    const router = new KoaRouter();

    app.use(json());

    router.get('/test', ctx => ctx.body = "Test is working");

    # app.use(async ctx => ctx.body = {
    #   message: "Hello World"
    # });

    app.use(router.routes()).use(router.allowedMethods());

    app.listen(3000, () => console.log('Server start 3000...'));

17) Проверить, что роутер `localhost:3000/test` работает

18) Установить библиотеку koa-ejs

>>> npm i koa-ejs

19) Установить библиотеку path

>>> npm i path

    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');
    const render = require('koa-ejs');
    const path = require('path');

    const app = new Koa();
    const router = new KoaRouter();

    app.use(json());

    router.get('/test', ctx => ctx.body = "Test is working");

    app.use(router.routes()).use(router.allowedMethods());

    app.listen(3000, () => console.log('Server start 3000...'));

20) Подключить и настроить рендер страниц

    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');
    const render = require('koa-ejs');
    const path = require('path');

    const app = new Koa();
    const router = new KoaRouter();

    app.use(json());

    render(app, {
        root: path.join(__dirname,'views'),
        layout: 'layout',
        viewExt: 'html',
        cache: false,
        debug: false
    });

    router.get('/', async ctx => {
        await ctx.render('index');
    })

    # router.get('/test', ctx => ctx.body = "Test is working");

    app.use(router.routes()).use(router.allowedMethods());

    app.listen(3000, () => console.log('Server start 3000...'));

21) Создать каталог `views`, файлы layout.html, index.html

    # layout.html
    <!DOCTYPE html>
    <html lang="en">

    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Tasks</title>
    </head>

    <body>

    <div class="container">
        <%- body %>
    </div>

    </body>

    </html>

    # index.html
    <h1>My Tasks</h1>

22) Добавим библиотеку Bootstrap 4/5

    # index.html
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Tasks</title>
    <link href=" https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

23) Создать файл menu.html

    # menu.html
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <div class="container">
        <a class="navbar-brand" href="/">Add Tasks</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/add">Add task</a>
            </li>
        </ul>
        </div>
    </div>
    </nav>

    # layout.html
    <body>
    <% include menu.html %>
    <div class="container">
        <%- body %>
    </div>
    </body>

24) Подправим app.js, чтобы он отдавал данные

    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');
    const render = require('koa-ejs');
    const path = require('path');

    const app = new Koa();
    const router = new KoaRouter();

    app.use(json());

    render(app, {
        root: path.join(__dirname,'views'),
        layout: 'layout',
        viewExt: 'html',
        cache: false,
        debug: false
    });

    router.get('/', async ctx => {
        await ctx.render('index', {
            title: "My favorite tasks..."
        });
    });

    app.use(router.routes()).use(router.allowedMethods());
    app.listen(3000, () => console.log('Server start 3000...'));

25) Подправим index.html, чтобы он принимал данные

    # index.html
    <h1><%- title %></h1>

26) Создадим массив задач, заполним его начальными данными

    # app.js
    const app = new Koa();
    const router = new KoaRouter();

    const tasks = ['Купить молоко','Купить пиво','Купить хлеб'];

    app.use(json());

    render(app, {
        root: path.join(__dirname,'views'),
        layout: 'layout',
        viewExt: 'html',
        cache: false,
        debug: false
    });

27) Передадим массив вместе с контекстом, выведем его на главной странице

    # app.js
    router.get('/', async ctx => {
        await ctx.render('index', {
            title: "My favorite tasks...",
            tasks: tasks
        });
    });

    # index.html
    <h1><%- title %></h1>

    <ul class="list-group">
        <% tasks.forEach (t => { %>
            <li class="list-group-item">
                <%= t %>
            </li>        
        <% }); %>
    </ul>

28) Перепишем роутеры, чтобы был формат роутер + функция

    # app.js
    router.get('/', index);

    async function index(ctx) {
        await ctx.render('index', {
            title: 'My Tasks List',
            todos: todos
        });
    }

29) Создадим роутер `/showAdd`

    router.get('/add', showAdd);

    async function showAdd(ctx) {
        await ctx.render('add');
    }

30) Создадим файл add.html

    <h1 class="display-4 mb-4">
    Add New Task
    </h1>

    <form action="/add" method="POST">

    <div class="form-group">
        <input name="task" type="text" class="form-control form-control-lg">
    </div>
    <br>
    <input type="submit" value="Add" class="btn btn-danger btn-lg">
    <a href="/" class="btn btn-danget btn-lg">Cancel</a>

    </form>

31) Cоздадим роутер `/add` для метода post

    # app.js
    const Koa = require('koa');
    const KoaRouter = require('koa-router');
    const json = require('koa-json');
    const path = require('path');
    const render = require('koa-ejs');
    const bodyParser = require('koa-bodyparser');

    const app = new Koa();
    const router = new KoaRouter();
    const todos = ['Купить молока', 'Купить хлеба', 'Завоевать мир'];

    app.use(json());
    app.use(bodyParser());

    render(app, {
        root: path.join(__dirname, 'views'),
        layout: 'layout',
        viewExt: 'html',
        cache: false,
        debug: false
    });

    router.get('/', index);
    router.get('/add', showAdd);
    router.post('/add', add);

    async function index(ctx) {
        await ctx.render('index', {
            title: 'My Tasks List',
            todos: todos
        });
    }

    async function showAdd(ctx) {
        await ctx.render('add');
    }

    async function add(ctx) {
        const body = ctx.request.body;
        todos.push(body.task);
        ctx.redirect('/');
    }

    app.use(router.routes()).use(router.allowedMethods());

    app.listen(3000, () => {
        console.log("Server start 3000...");
    });