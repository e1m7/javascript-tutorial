
Лекция 5: булевые переменные
============================

Вводные понятия
===============

1) Булевых переменных две: true, false
2) Логических операций три: and (&&), or (||), not (!)
3) В выражении они выполняются: not >> and >> or
4) Порядок можно поменять с помощью ()

Мы открыли две подтемы

  1) условия
  2) сравнения

Подтема 1: Conditionals (условия)
=================================

1) if (условие) { блок кода }
2) if (условие) { блок кода 1 } else { блок кода 2 }
3) Возможны вложенные условия

    let a = 10;
    let b = 20;
    if (a > b) {
      console.log('Переменная a больше b');
    } else if (a < b) {
      console.log('Переменная a меньше b');
    } else {
      console.log('Переменная a равна b');
    }

4) Условия надо заключать в скобки
5) Условия могут быть сложные
6) Условия можно оформлять переменными

Задача: дано число, выяснить делится ли оно на 3 и на 5

    let a = 15;
    if (a % 3 == 0 && a % 5 == 0) {
        console.log('Да, число ' + a + ' делится на 3 и 5');
    } else {
        console.log('Нет, число ' + a + ' не делится на 3 и 5');
    }

    let a = 15;
    let div3 = a % 3 == 0;
    let div5 = a % 5 == 0;
    if (div3 && div5) {
        console.log('Да, число ' + a + ' делится на 3 и 5');
    } else {
        console.log('Нет, число ' + a + ' не делится на 3 и 5');
    }

Замечание: условие не обязательно(!) должно быть логическое

    const num = 4;
    if (num) {
      console.log('Да, 4 конвертируется в true');
    }

Замечание: если оператор внутри скобок один, то {} не нужны

    const num = 4;
    if (num) console.log('Да, 4 конвертируется в true');

Замечание: если внутри блока есть return, то if прерывается


Подтема 2: Comparison (сравнения)
=================================

Сравнение чисел
  1) a > b
  2) a >= b
  3) a < b
  4) a <= b
  5) a === b
  6) a !== b

Замечание: результатом сравнение всегда будет true|false

    console.log(1 < 3);                 // true
    console.log(2 != 2);                // false
    console.log(1 === 1.0);             // true

Сравнение строк
  1) a > b
  2) a >= b
  3) a < b
  4) a <= b
  5) a === b
  6) a !== b

    console.log('Apple' > 'Pear');     // false
    console.log('a' > 'above');        // true
    console.log('a' === 'A');          // false

Замечание: сравнивать строк и числа можно, но опасно

    console.log(10 < 2);               // false
    console.log('10' < '2');           // true

Замечание: есть метод сравнения localeCompare, он дает варианты
Замечание: как правило используют === (нет приведения типов)

    console.log('3' === 3);           // false
    console.log(1 === 1n);            // false

Замечание: в 99% случае рекомендуют === или !==

    Мини-задача: 0 == false ?


Задача 5 "Annalyn's Infiltration"
=================================

  Задача: ответить на вопросы

    // можно ли атаковать рыцаря
    export function canExecuteFastAttack(knightIsAwake) {
      return !knightIsAwake;
    }

    // можно ли шпионить
    export function canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake) {
      const spy = (knightIsAwake || archerIsAwake || prisonerIsAwake);
      return spy;
    }

    // можно ли подать сигнал
    export function canSignalPrisoner(archerIsAwake, prisonerIsAwake) {
      const signal = (!archerIsAwake && prisonerIsAwake);
      return signal;
    }

    // можно ли освободить пленника
    export function canFreePrisoner(
      knightIsAwake,
      archerIsAwake,
      prisonerIsAwake,
      petDogIsPresent
    ) {
      if (petDogIsPresent) {
        return !archerIsAwake;
      } else {
        const posible = !knightIsAwake && !archerIsAwake && prisonerIsAwake;
        return posible;
      }
    }
