
Лекция 1: основы языка
======================

Наш сайт для лекций: https://scrimba.com
Мой логин: login
Мой пароль: password

Наш сайт для практики: https://exercism.org
Мой логин: login
Мой пароль: password

Наш сайт для практики: https://edabit.com
Мой логин: login
Мой пароль: password

Вводные понятия
===============

1) JavaScript самый популярный язык программирования
2) На нем можно создавать полноценные приложения
3) Средняя зарплата по миру 72,000$ в год
4) Можно работать frontend|backend разработчиком
5) JavaScript используется для создания
  - mobile app
  - desktop app
  - web app
  - commandline app
  - games
6) JavaScript работает в любом браузере (V8 engine)
7) JavaScript работает в NodeJS (C++ & V8 engine)
8) Есть разница между JavaScript и ECMAScript (спецификации)

JavaScript поддерживает
=======================

  1) императивный стиль (последовательные команды)
  2) декларативный стиль (описание результата, а не решения)
  3) ооп стиль (классы, методы, свойства и работа с ними)

Присваивание
============

  1) переменные (let, var)
  2) константы (const)

    let myFirst = 1;
    myFirst = 'Hello World';
    console.log(myFirst);
    const MY_CONSTANT = 10;
    console.log(MY_CONSTANT);
    MY_CONSTANT = 20;

Замечание: константу нельзя менять, но если она состоит из частей, то их можно

    const MY_CONST = { food: 'apple' };
    MY_CONST.food = 'apelsin';
    console.log(MY_CONST);

Замечание: можно явно указать константе, что нельзя менять даже ее часть

    const MY_CONST = Object.freeze({ food: 'apple' });

Функции
=======

  1) функция это единица функциональности
  2) функции могут принимать параметры и возвращать значения
  3) определяются через `function`, вызываются через ()

    function add(num1, num2) {
      return num1 + num2;
    }

    let a = add(1, 3);
    console.log(a);

Замечание: есть много способов объявить функцию (function, =>)

Концепции языка
===============

  1) export (отдать коду куда-то)
  2) import (загрузить код откуда-то)

Замечание: мы можем экспортировать из файла переменные, функции, классы
Замечание: мы можем импортировать из библиотек переменные, функции, классы
Замечание: эта технология используется, например, при тестировании

    # файл file.js
    export const MY_VALUE = 10;
    export function add(num1, num2) {
      return num1 + num2;
    }
    # файл file.js

    # файл index.js
    import { MY_VALUE, add } from './file';
    console.log(add(MY_VALUE, 5));    
    # файл index.js

Задача 1 "Hello World"
======================

  Условие: вывести на экран "Hello World"

    // вывести строку 'Hello, World!'
    export function hello() {
      return 'Hello, World!';
    }