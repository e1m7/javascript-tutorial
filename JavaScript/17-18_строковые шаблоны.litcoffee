
Лекция 17-18: строковые шаблоны
===============================

Вводные понятия
===============

1) В JavaScript можно вставлять значения переменных в строку
2) Эта технология называется интерполяция
3) Интерполяция возможна при `такой строке ${value}`
4) Значение переменной value => строку
5) При использовании `можно переносить строки
и они будут выглядеть нормально`

    const num1 = 1;
    const num2 = 2;
    console.log(`${num1} + ${num2} равно ${num1 + num2}`);

    const track = 'JavaScript';
    console.log(`Вывести слово так ${track.toUpperCase()}`);

Замечание: в JavaScript есть тернарный оператор

    let a = 10;
    let b = a > 5 ? 100 : 200;

Замечание: при интерполяции строк можно использовать тернарный оператор    


Задача 17 "Custom Signs"
========================

  Задача: вывести для рекламной компании

    // вывести "привет, роб"
    export function buildSign(occasion, name) {
      return `Happy ${occasion} ${name}!`;
    }

    // вывести приветствие в зависимости от возраста
    export function buildBirthdaySign(age) {
      return `Happy Birthday! What a ${age >= 50 ? 'mature' : 'young'} fellow you are.`;
    }

    // вывести поздравление на две строки
    export function graduationFor(name, year) {
      return `Congratulations ${name}!\nClass of ${year}`;
    }

    // вывести строку с долларами или евро
    export function costOf(sign, currency) {
      let price = 20 + (sign.length * 2);
      return `Your sign costs ${price}.00 ${currency}.`;
    }
