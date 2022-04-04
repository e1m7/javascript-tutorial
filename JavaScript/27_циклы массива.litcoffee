
Лекция 27: циклы массива
========================

Цикл for
========

    const numbers = [6.0221515, 10, 23];
    for (let i = 0; i < numbers.length; i++) {
      console.log(numbers[i]);
    }

Цикл for ... of
===============

Замечание: цикл for дает нам всякий раз индекс массива
Замечание: цикл for...of просто пробегает по массиву, дает нам элемент

    const numbers = [6.0221515, 10, 23];
    for (const number of numbers) {
      console.log(number);
    }

Метод forEach
=============

1) У каждого массива есть метод forEach
2) forEach принимает callback как параметр
3) callback вызывается для каждого элемента

    const numbers = [6.0221515, 10, 23];
    numbers.forEach((number, index) => console.log(number, index));

Замечание: у forEach нет операторов break || continue


Выводы по перебору массива
==========================

  1) for (определить 0-ой, последний и запустить цикл)
  2) for...of (определить куда кладем очередной элемент)
  3) forEach (вызвать с (val, idx) значение и его индекс)


Задача 27 "Elyses Looping Enchantments"
=======================================

  Задача: Элиза анализирует колоду разными способами

    // сколько карт определенного типа в колоде
    export function cardTypeCheck(stack, card) {
      let answer = 0;
      stack.forEach( (d, i) => {
        if (d == card) answer++;
      })
      return answer;
    }

    // сколько четных и нечетных карт в колоде
    export function determineOddEvenCards(stack, type) {
      let a = 0;   // нечетный 
      let b = 0;  // четный
      for (let c of stack) {
        if (c % 2 == 0) { a++; } else { b++; }
      }
      if (type) return a;
      return b;
    }