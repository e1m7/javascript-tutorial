
Лекция 4: строки
================

Вводные понятия
===============

1) Строки хранят строковые данные
2) Нет типа данных для символов
3) Строки могут быть в двойных или одинарных кавычках
4) Внутри строки возможно использование специальных символов

  \n новая строка
  \t табуляция
  \\ обратный слеш
  \" кавычка

5) Строки могут быть в обратных кавычках (бак-тиках), клавиша Ё
6) Cтроки это списки, каждый элемент имеет индекс (первый = 0)
7) Обратится к отдельному символу можно 

    let a = "Hello World";
    console.log(a[0]);
    console.log(a.charAt(0));

8) Количество символов в строке хранится в свойстве lenght

    let a = "Hello World";
    console.log(a.length);

9) Для строк определено много методов

    toUpperCase
    toLowerCase
    trim
    includes
    startsWith
    endsWith
    slice

Замечание: все методы (выше) не меняют саму строку (создают новую)
Замечание: строки immutable (не изменяемые), нельзя a[0] = 'Z'


Задача 4 "Poetry Club Door Policy"
==================================

  Задача: обработать пароль


    // вернуть первую букву
    export function frontDoorResponse(line) {
      return line[0];
    }

    // вернуть строку с большой буквы
    export function frontDoorPassword(word) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }

    // вернуть последнюю букву
    export function backDoorResponse(line) {
      return line.trim().slice(-1);
    }

    // вернуть слово с добавлением 'please'
    export function backDoorPassword(word) {
      return frontDoorPassword(word) + ", please";
    }
