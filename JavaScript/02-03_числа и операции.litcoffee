
Лекция 2-3: числа и арифметические операции
===========================================

Вводные понятия
===============

1) JavaScript есть два типа чисел: number, bigint
2) Number это числа (целые, дробные) в 64-битном формате
3) Bigint это числа в произвольном формате точности
4) Простое число (42) это в реальности 42.0
5) Можно задать 2-ичные числа (0b101010)
6) Можно задать 8-ричные числа (0o1314)
7) Можно задать 16-ричные числа (0x0AB)
8) Можно задать числа в e-нотации (3.125e7 = 3.125 * 10^7 = 31,250,000)
9) Можно использовать подчеркивания (31,250,000 = 31_250_000)

Встроенные методы
=================

  1) Number
    - проверка типа (рассмотрим позже)
    - преобразование типа (рассмотрим позже)
    - форматирование чисел (рассмотрим позже)

  2) Math (не работает c Bigint)

    Math.floor(234.34);
    Math.ceil(234.34);
    Math.max
    Math.min
    Math.pow
    Math.random
    Math.trunc

Список всех функций https://t.ly/TGs7

Замечание: Number это объект, его можно использовать

    let a = '12.15';
    console.log(Number(a));

    const date = new Date('December 17, 1995 03:24:00');
    const unix = Number(date);
    console.log(unix);

Замечание: Number дает доступ к особым числам

  1) Number.MAX_VALUE
  2) Number.MIN_VALUE
  3) Number.POSITIVE_INFINITY
  4) Number.NEGATIVE_INFINITY
  5) Number.MAX_SAFE_INTEGER
  6) Number.MIN_SAFE_INTEGER

Замечание: в JavaScript есть специальные числа

  1) NaN (не число)
  2) Infinity (бесконечность)
  3) +0
  4) -0

    Number('123');              // 123
    Number('Hello, World!');    // NaN
    Math.sqrt(-64);             // NaN
    NaN + 100;                  // NaN
    NaN === NaN;                // false (не число != не число)
    isNaN(NaN);                 // является ли число NaN (true)
    isNaN(123);                 // является ли число NaN (false)

Замечание: бесконечность это ошибка числа (слишком большое|маленькое)

    Math.pow(2, 1024);          // Infinity
    6 / 0;                      // Infinity
    -6 / 0;                     // -Infinity

Замечание: Infinity > любого числа (кроме NaN)

    isFinite(80085);            // это число? (true)
    isFinite(Infinity);         // это число? (false)
    isFinite(NaN);              // это число? (false)

Замечание: +0 и -0 это разные числа в JavaScript
Замечание: лучше работать с 0 и не получать +0 или -0

Сравнение чисел
===============

    console.log(1 = 1.0);
    console.log(1 == 1.0);
    console.log(1 === 1.0);
    console.log(1 === 1n);

Замечание: мы еще поговорим про сравнения...
Замечание: числа с плавающей запятой не факт, что будут равны друг другу

    console.log(0.1 + 0.2 === 0.3);

Арифметические операции
=======================

    1 + 2;                // 3
    2.5 + 3.9;            // 6.5
    19 - 2;               // 17
    7.4 - 1.2;            // 1.5
    7 * 5;                // 35
    9.2 * 6.3;            // 57.959999999999994
    8 / 2;                // 4
    25 / 3;               // 8.333333333333334
    40 % 4;               // 0
    11 % 4;               // 3
    -11 % 4;              // -3
    4 ** 3;               // 64
    4 ** 1 / 2;           // 2

Замечание: можно использовать укороченные операторы

    let x = 5;
    x += 25;              // ???

    let y = 31;
    y %= 3;               // ???


Задача 2-3 "Freelancer Rates" 
===========================

  Задача: рассчитать зарплату

    // вычислить дневную ставку
    export function dayRate(ratePerHour) {
      return ratePerHour * 8;
    }

    // рассчитать число дней работы
    export function daysInBudget(budget, ratePerHour) {
      return Math.floor(budget / (ratePerHour * 8));
    }

    // рассчитать оплату со скидкой
    export function priceWithMonthlyDiscount(ratePerHour, numDays, discount) {
      const mon = Math.floor(numDays / 22);      // всего месяцев работал (по 22 дня)
      const day = numDays % 22;                  // всего дней сверх этого (остаток)
      return Math.ceil((1 - discount) * (mon * 22 * 8 * ratePerHour) + day * 8 * ratePerHour);
    }

    # (1 - discount) = сколько реально процентов на оплату (при скидке 2% оплата 98% от суммы)
    # (mon * 22 * 8 * ratePerHour) = месяцов * 22 дня * 8 часов * ставка (денег за месяцы работы)
    # day * 8 * ratePerHour = дни * 8 часов * ставка (денег за оставшиеся дни работы)






