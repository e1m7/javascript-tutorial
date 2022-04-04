
Лекция 19: замыкания(*****)
====================

Вводные понятия
===============

1) Замыкания это шаблон программирования в JavaScript
2) Замыкания позволяют использовать переменыне из внешней области во внутренней
3) JavaScript поддерживает замыкания прозрачно, вы уже использовали их

    # переменная dozen имеет глобальную область видимости
    const dozen = 12;

    {
      # 1) скобки создают новую область
      # 2) переменная twoDozen ссылается на dozen
      # 3) twoDozen из локальной области
      # 4) dozen из глобальной области
      # 1-4) создает замыкание
      const twoDozen = dozen * 2;
    }

    # функция nDozen() создает новую область
    # ссылка на dozen снова создает замыкание
    function nDozen(n) {
      return dozen * n;
    }

Зачем нужно замыкание
=====================

  1) сохраняет состояние
  2) передает значения

    let counter = 0;

    function increment() {
      counter += 1;
      return counter;
    }  

    increment();
    increment();
    increment();
    console.log(counter); 


Задача 19 "Coordinate Transformation"
=====================================

  Задача: замыкания для пары координат {x,y}

    // вернуть функцию, которая делает замыкание и возвращает сумму x+dx, y+dy
    export function translate2d(dx, dy) {
      return function (x, y) {
        return [x + dx, y + dy];
      }
    }

    // вернуть функцию, которая делает замыкание x*dx, y*dy
    export function scale2d(sx, sy) {
      return function (x, y) {
        return [x * sx, y * sy];
      }
    }

    // вернуть композицию функций f(g(x))
    export function composeTransform(f, g) {
      return function (x, y) {
        const [a, b] = f(x, y);
        return g(a, b);
      }
    }

    // сделать функцию, которая запоминает параметры
    export function memoizeTransform(f) {
      let saveX;
      let saveY;
      let saveRes;
      return function (x, y) {
        if (x !== saveX && y !== saveY ) {
          saveX = x;
          saveY = y;
          saveRes = f(x, y);
        }
        return saveRes;
      }
    }