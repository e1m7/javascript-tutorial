
Лекция 20-21: callback (обратные вызовы)(*****)
========================================

Вводные понятия
===============

1) Callback это функции, которые передаются как аргументы другой функции
2) Это очень часто делается при выполнении асинхронных запросов
3) В целом callback-функция, это обычная функция, но со странными аргументами

    # 1) создали переменную squareLength = 5
    # 2) простая переменная в глобальной области
    const squareLength = 5;

    # 3) создали функцию applyToSquare, которая принимает callback
    # 4) callback это какой-то параметр, что с ним делает функция?
    # 5) она использует его как имя функции, которую вызывает со squareLength
    function applyToSquare(callback) {
      return callback(squareLength);
    }

    # 6) создали функцию areaOfSquare, которая принимает number
    # 7) number это число, просто число (1,2,3,...)
    # 8) функция возвращает number * number
    function areaOfSquare(number) {
      return number * number;
    }

    # 9) выводим на экран результат вызова функции applyToSquare
    # 10) эта функция требует, что ее параметр = функции
    # 11) да, это так, параметр = areaOfSquare
    # 12) ответ = 25
    console.log(applyToSquare(areaOfSquare));

Замечание: при написании callback-функий их можно писать внутри кода

Cтрелочные функции
==================

Мы можем более просто описывать функции

    # можно так
    function addUpTwoNumbers(num1, num2) {
      return num1 + num2;
    }

    # можно так
    const addUpTwoNumbers = (num1, num2) => {
      return num1 + num2;
    };

    # если тело функции = одна строка, то можно не писать {} и return
    const addUpTwoNumbers = (num1, num2) => num1 + num2;


Задача 20 "Fruit Picker"
========================

  Задача: создать библиотеку API-функция для бакелейщика

    import { checkStatus, checkInventory } from './grocer';

    // проверка статуса: онлайн или нет
    export function isServiceOnline() {
      return checkStatus( (status) => status === 'ONLINE' );
    }

    // запросить инвентарь
    export function pickFruit(variety, quantity, callback) {
      return checkInventory({ variety, quantity }, callback);
    }

    // купить фрукты, если инвентарь доступен
    export function purchaseInventoryIfAvailable(err, isAvailable) {
      if (err) throw Error(err);
      return isAvailable ? 'PURCHASE' : 'NOOP';
    }

    // собрать все вместе
    export function pickAndPurchaseFruit(variety, quantity) {
      return pickFruit(variety, quantity, purchaseInventoryIfAvailable);
    }