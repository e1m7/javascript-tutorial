
Функциональное програмирование: функции высшего порядка
=======================================================

Продвинутый reduce
==================

Замечание: reduce может "свернуть" данные в число, массив, во что угодно
Замечание: особенно хорошо это видно, когда функции работают друг с другом

Задача: есть файл с данными, в одной строке они разделены табуляцией

  1) строка состоит из имени пользователя и данных про него
  2) строк много, часть имеют в начале одинаковое имя
  3) мы хотим получить структуру типа json, где все собрано вместе

    # data.txt
    Bart Simpson	run	100	5
    Bart Simpson	sleep	200	4
    Bart Simpson	look cartoon	90	6
    Homer Simpson	drink beer	100	1
    Homer Simpson	working in station	10	2
    Homer Simpson	sleep	200	10
    Bart Simpson	driver	70	4

    # хотим получить
    {
      "Bart Simpson": [
        {
          "name": "run",
          "price": "100",
          "ratind": "5"
        },
        {
          "name": "sleep",
          "price": "200",
          "ratind": "4"
        },
        {
          "name": "look cartoon",
          "price": "90",
          "ratind": "6"
        },
        {
          "name": "driver",
          "price": "70",
          "ratind": "4"
        }
      ],
      "Homer Simpson": [
        {
          "name": "drink beer",
          "price": "100",
          "ratind": "1"
        },
        {
          "name": "working in station",
          "price": "10",
          "ratind": "2"
        },
        {
          "name": "sleep",
          "price": "200",
          "ratind": "10"
        }
      ]
    }
    # хотим получить

    # 1.js
    const fs = require('fs')
    const output = fs.readFileSync('data.txt');
    console.log(output);

Немного функциональной магии
============================

1) добавим кодировку

    const output = fs.readFileSync('data.txt', 'utf8')

2) добавим разбиение на строки

    const output = fs.readFileSync('data.txt', 'utf8')
      .split('\n')

3) удалим возможную пустую строку

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')

4) разобьем каждую строку массива по табуляции на массив

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))

5) соберем массив массивов в объект

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce(() => { }, {})

6) укажем переменные (аккумулятор, очередной) и вернем из функции customer

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        return customer;
      }, {})

7) выведем внутри reduce значение line

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        console.log('Hello', line)
        return customer;
      }, {})

8) внутри функции попробуем занести 0-ой элемент line в словарь

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        customer[line[0]] = []
        return customer;
      }, {})

9) добавим еще данных каждый раз при встрече строки

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        customer[line[0]] = []
        customer[line[0]].push({
          name: line[1],
          price: line[2],
          ratind: line[3]
        })
        return customer;
      }, {})

10) скорректируем вывод output, чтобы json-формат был красивый

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        customer[line[0]] = []
        customer[line[0]].push({
          name: line[1],
          price: line[2],
          ratind: line[3]
        })
        return customer;
      }, {})

    console.log(JSON.stringify(output, null, 2));

11) исправим создание пустого массива с именами каждый раз при итерации

    const output = fs.readFileSync('data.txt', 'utf8')
      .trim()
      .split('\n')
      .map(line => line.split('\t'))
      .reduce((customer, line) => {
        customer[line[0]] = customer[line[0]] || []
        customer[line[0]].push({
          name: line[1],
          price: line[2],
          ratind: line[3]
        })
        return customer;
      }, {})