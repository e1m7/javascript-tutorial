
Лекция 24: анализ массивов
==========================

Анализ массивов
===============

1) Массивы имеют встроенные методы для анализа
2) (Как правило) методы принимают функцию (true|false)

Пример: как найти есть ли в массиве значение `two`

    # вернется индекс = 1
    const numbers = [1, 'two', 3, 'four'];
    for (var i = 0; i < numbers.length; i++) {
      if (numbers[i] === 'two') {
        return i;
      }
    }

    # встроенный метод
    const numbers = [1, 'two', 3, 'four'];
    numbers.indexOf('two');

Некоторые методы массивов
=========================

  1) Метод includes = содержит ли массив определенное значениe
  =================

    const numbers = [1, 'two', 3, 'four'];
    console.log(numbers.includes(1));
    console.log(numbers.includes('one'));

  2) Метод every = проверяет все ли элементы массива проходят тест
  ==============

    const numbers = [1, 3, 5, 7, 9];
    console.log(numbers.every((num) => num % 2 !== 0));

  3) Метод some = проверяет проходит ли хотя бы один(!) элемент тест
  =============

    const numbers = [2, 4, 6, 7, 8, 10];
    console.log(numbers.some((num) => num % 2 !== 0));

  4) Метод find = возвращает значение 1-го элемента, который удовлетворяет 
  =============

    const numbers = [1, 3, 5, 7, 9];
    console.log(numbers.find((num) => num < 5));

  5) Метод findIndex = возвращает индекс первого элемента, который удовлетворяет
  ==================

    const numbers = [1, 3, 5, 7, 9];
    cosnole.log(numbers.findIndex((num) => num > 7));
    cosnole.log(numbers.findIndex((num) => num > 10));
  

Задача 24 "Elyses Analytic Enchantments"
========================================

  Задача: волшебница Элиза и несколько колод карт

  1) includes = содержит ли
  2) every = все ли проходят тест
  3) some = проходит тест хотя бы один
  4) find = найти значение
  5) findIndex = найти индекс

    // найти позицию карты в колоде
    export function getCardPosition(stack, card) {
      return stack.findIndex( (c) => c == card );
    }

    // есть ли карта в колоде
    export function doesStackIncludeCard(stack, card) {
      return stack.some( (c) => c == card );
    }

    // все ли карты четные
    export function isEachCardEven(stack) {
      return stack.every( (c) => c % 2 == 0 );
    }

    // есть ли в колоде нечетное число
    export function doesStackIncludeOddCard(stack) {
      return stack.some( (c) => c % 2 != 0 );
    }

    // значение первой нечетной карты
    export function getFirstOddCard(stack) {
      return stack.find( (c) => c % 2 != 0 );
    }

    // позиция первой четной карты
    export function getFirstEvenCardPosition(stack) {
      return stack.findIndex( (c) => c % 2 == 0 );
    }