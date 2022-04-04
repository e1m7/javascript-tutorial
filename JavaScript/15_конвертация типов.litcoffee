
Лекция 15: конвертация типов
============================

Вводные понятия
===============

1) Явное преобразование типов = я хочу поменять тип переменной
2) Неявное преобразование типов = случилась ситуация, при которой тип поменялся
3) Boolean(val) = переведет в булевый тип
4) Number(val) = переведет в строковый тип
5) String(val) = переведет в строковый тип

Конвертация в Boolean
=====================

  1) false, 0, null, '', undefined, NaN => false
  2) все остальное => true

    Boolean(-1);
    Boolean(0);
    Boolean(' ');
    Boolean('');

Замечание: строки типа '0' или 'false' это => true
Замечание: переменные {} и [] это => true

Конвертация в Number
====================

  1) пробелы игнорируются
  2) пустая строка => 0
  3) не число => NaN

    Number('  -12.34  ');
    Number('1,2');
    Number('');
    Number({ num: 123 });

Конвертация в String
====================

  1) все просто

    String(12.34);
    String(false);
    String(null);
    String(undefined);  

Для массивов и объектов

  1) элементы => строки
  2) null, undefined => ''
  3) все элементы склеятся в строку, разделенную запятой
  4) объекты => object

    String([42, null, true, 'abc']);
    String({ key: 'value' });


Автоматическое приведение типов
===============================

В некоторых случаях JavaScript делает автоматические приведение

Пример: вычисление выражения для условия => булевый тип

    const num = 0;
    if (num) {
      // не будут выполнено ( 0 => false)
    }

Пример: если сложить строку и переменную => строка

    let name;
    'hello ' + name;

Пример: если число складывается с другим типом => число


Задача 15 "Lucky Numbers"
=========================

  Задача: работа с числами для сайта друга

    // сложить два массива [1,2,3]+[0,7] = 123+07=130
    export function twoSum(array1, array2) {
      let a = array1.join('');
      let b = array2.join('');
      return Number(a) + Number(b);
    }

    // проверить числа на палиндром 1441 == 1441
    export function luckyNumber(value) {
      let a = String(value);
      let b = String(value).split('').reverse().join('');
      return a == b;
    }

    // обработка нажатия на кнопку
    export function errorMessage(input) {
      if (input == '' || input == null) {
        return 'Required field';
      }
      if (isNaN(input) || input == '0') {
        return 'Must be a number besides 0';
      }
      return '';
    }