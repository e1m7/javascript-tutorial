
Лекция 13: объекты
==================

Вводные понятия
===============

1) В JavaScript есть примитивные типы (строки, числа, булевые)
2) В JavaScript есть также сложные типы (объекты = карты = словари)
3) Объект состоит из пары ключ:значение
4) Ключ может быть только строкой, значение может быть любого типа
5) Объекты удобны для ООП (объектно-ориентированного программирования)

Создание объектов
=================

Для создания используют {}, некоторые значения можно указывать сразу

    const emptyObject = {};

    const obj = {
      obj_number: 42,
      obj_string: 'Hello World',
      status: true,
      address: {
        street: 'улица Ленина 100',
        city: 'Рязань',
      },
      fruits: ['ананас', 'манго'],
      addNumbers: function (a, b) {
        return a + b;
      },                    <== запятая не обязательна 
    };

Замечание: ключи должны быть в кавычках (это строки)
Замечание: если ключ простой (в одно слово), то не обязательно

    # не переписываем, просто смотрим...
    const obj = {
      '1keyStartsWithNumber': '...',
      'key/with/slashes': '...',
      'key-with-dashes': '...',
      'key with spaces': '...',
      '#&()[]{}èä樹keyWithSpecialChars': '...',
    };

Замечание: для удобства есть сокращенные записи

    # вместо такого объявления объекта...
    const x = 1;
    const y = 2;

    const obj = {
      x: x,
      y: y,
      calcSum: function (a, b) {
        return a + b;
      },
    };

    # можно писать таким образом...
    const obj = {
      x,
      y,
      calcSum(a, b) {
        return a + b;
      },
    };   

Замечание: значение переменной может быть ключом и использоватся в коде
Замечание: в этом случае его надо брать в []

    const key = 'greeting';

    const obj = {
      [key]: 'hello world',
    };
    console.log(obj);


Доступ к объектам
=================

Замечание: получать значения из объекта можно 
  1) через точку (ООП-стиль) (если ключ является простой строкой)
  2) через [] (массив-стиль) (если ключ не простой, то кавычки)
  3) через имя переменной

    const obj = { greeting: 'hello world' };
    obj.greeting;
    obj['greeting'];
    const key = 'greeting';
    obj[key];  

Замечание: если в объекте нет записи с ключом, то вернется undefined
Замечание: если объект сложный (объект, объект), то ключи можно связать

    const obj = {
      address: {
        street: 'Шоссе Энтузиастов',
        city: 'Владивосток',
      },
    };

    obj.address.city;
    obj['address']['city'];
    obj.address['city'];

Добавление значений
===================

    const obj = { greeting: 'Первая строка' };
    obj.greeting = 'Вторая строка';
    obj['greeting'] = 'Третья строка';
    obj.newKey1 = 'Новая строка 1';
    obj['new key 2'] = 'Новая строка 2';
    const key = 'Странный ключ';
    obj[key] = 'Новая строка 3';

Удаление значений
=================

    const obj = {
      key1: 'value1',
      key2: 'value2',
    };

    delete obj.key1;
    delete obj['key2'];

Замечание: если установить значение в undefined, то оно не будет удалено(!)

Проверка существования
======================

Замечание: hasOwnProperty проверяет есть ли в объекте запись с таким ключом
Замечание: hasOwnProperty не смотрит на вложенные ключи, только корень

    const obj = { greeting: 'hello world' };
    obj.hasOwnProperty('greeting');
    obj.hasOwnProperty('age');

Проход по объекту
=================

1) Цикл for .. in проходит по всем элементам объекта
2) Проход идет не по порядку, порядка в элементах нет

    const obj = {
      name: 'Ali',
      age: 65,
    };

    for (let key in obj) {
      console.log(key, obj[key]);
    }

Замечание: for .. in проходит по всем ключам (даже вложенным)
Замечание: если это не нужно, то надо делать так

    # идем по объекту, перебирая ключи
    for (let key in obj) {
      # если hasOwnProperty не нашел такого ключа (в корне)
      if (!obj.hasOwnProperty(key)) {
        # пропускаем такое значение, это вложенное свойство
        continue;
      }
      // основной код
      // основной код
      // основной код
    }

Замечание: for .. in это проход по объектам (что-то находится внутри чего-то)
Замечание: for .. of это проход по массивам (что-то состоит из чего-то)

Работа с ключами и значениями
=============================

    const obj = {
      name: 'Ali',
      age: 65,
    };
    Object.keys(obj);       // вернуть все ключи
    Object.values(obj);     // вернуть все значения
    Object.entries(obj);    // вернуть массив [ [ключ, значение] ]

Важное замечание (вы его забудете)
==================================

Если мы не уверены в том, что свойство есть

    let obj = {
      name: 'Alexey',
      age: 30
    }
    console.log(obj.status?);



Пустой объект
=============

Замечание: иногда надо создать пустой объект

    let q = {};                        // нет, не так
    let q = Object.create(null);       // вот так сработает


Задача 13 "High Score Board"       
============================

  Задача: про школьную доску рекордов


    // Создать таблицу рекордов, ключи=имена, значения=рекорды
    export function createScoreBoard() {
      let tableRecords = {
        'The Best Ever': 1000000
      }
      return tableRecords;
    }

    // Добавить игрока в таблицу
    export function addPlayer(scoreBoard, player, score) {
      scoreBoard[player] = score;
      return scoreBoard;
    }

    // Удалить игрока из таблицы
    export function removePlayer(scoreBoard, player) {
      delete scoreBoard[player];
      return scoreBoard;
    }

    // Доабвить очков к рекорду игрока
    export function updateScore(scoreBoard, player, points) {
      scoreBoard[player] = scoreBoard[player] + points;
      return scoreBoard;
    }

    // Добавить каждому игроку по 100 очков
    export function applyMondayBonus(scoreBoard) {
      for (let key in scoreBoard) {
        updateScore(scoreBoard, key, 100);
      }
      return scoreBoard;
    }

    // Нормализовать оценку
    export function normalizeScore(params) {
      let s = params.score;
      let f = params.normalizeFunction;
      return f(s);
    }