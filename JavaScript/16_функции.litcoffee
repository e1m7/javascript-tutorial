
Лекция 16: функции
==================

Вводные понятия
===============

1) Функция это именованный блок кода для многократного использования
2) Функция определяется через слово `function` или стрелку `=>`
3) Определение состоит из

  1) function = ключевое слово
  2) someName = имя функции
  3) param1, param2, param3 = параметры (аргументы)

    function someName(param1, param2, param3) {
      // прекрасный код
      // прекрасный код
      // прекрасный код
    }

  4) Функция вызывается someName(1,2,3);
  5) Функция не вызывается через указание имени someName;

    function sayHello() {
      console.log('Hello, World!');
    }

    sayHello;
    sayHello();

Параметры функции
=================

Замечание: внутри функции параметры копируются в новые переменные
Замечание: после работы они умирают, они никак не влияют на глобальные

    const num = 0;

    # Локальная области видимости функции
    function add(num) {
      return num + 1;
    }
    # Локальная области видимости функции

    console.log(add(num));
    console.log(num);

Замечание: все это (что описано выше) работает для примитивных типов
Замечание: для массивов, объктов, функций передача идет по ссылке
Замечание: если изменить внутри функции массив, то он изменится 

    const nums = [0, 1, 2, 3, 4];

    function add(arr) {
      arr.push(5);
    }

    console.log(add(nums));
    console.log(nums);

Замечание: если у функции 10 параметров, а пришло 5, остальные = undefined
Замечание: имеет смысл давать параметрам значения по-умолчанию
Замечание: если у функции 3 параметра, а прислали 10, остальные = arguments
Замечание: возможно написать функцию с ? числом аргументов

Возвращаемое значение
=====================

1) Функция возвращает значение `return value`, операторов может быть много
2) Если не указать return, то функция вернет undefined (нет неявного возврата)
3) Через return нельзя вернуть несколько значений (return a,b,c;)
4) Чтобы вернуть много значений, их надо объединить в объект (массив)

    function isEven(a) {
      if (a % 2 == 0) {
        return 'Да, число четное';
      }
      return 'Нет, число не четное';
    }

    console.log(isEven(10));

Пример: дано два числа, вернуть их сумму и разность

    function returnAddSub(a, b) {
      return { add: a+b, sub: a-b }
    }

    let answer = returnAddSub(10,15);
    console.log(answer);


Функция как переменная
======================

1) Функция это переменная, ее можно присвоить и использовать
2) Например, функция = часть большого выражения
3) Например, функция = параметр другой функции
4) Например, функция = значение объекта

    let myAdd = function(a,b) {
      return a + b;
    }

    console.log(myAdd(1,3));
    console.log(myAdd(myAdd(1,2), myAdd(3,4)));


Задача 16 "Lasagna Master"
==========================

  Задача: написать с нуля функции для приготовления лазаньи

    // приготовление лазаньи
    export function cookingStatus(timeMinutes = 'error') {
      if (timeMinutes == 0) { return 'Lasagna is done.'; }
      if (timeMinutes == 'error') { return 'You forgot to set the timer.'; }
      return 'Not done, please wait.';
    }

    const layers = ['sauce', 'noodles', 'sauce', 'meat', 'mozzarella', 'noodles'];

    // рассчет времени = слоев * время
    export function preparationTime(layers, middleTime = 2) {
      return layers.length * middleTime;
    }

    // рассчитать лапшу и соус
    export function quantities(layers) {
      let answer = { noodles: 0, sauce: 0 };
      for (let el of layers) {
        if (el === 'noodles') { answer['noodles'] += 50; }
        if (el === 'sauce') { answer['sauce'] += 0.2; }
      }
      return answer;
    }

    // секретный ингридиент
    export function addSecretIngredient(friendsList, myList) {
      let secret = friendsList.slice(-1)[0];
      myList.push(secret);
    }

    // новый набор ингридиентов
    export function scaleRecipe(recipe, num) {
      let answer = {}
      for (let k in recipe) { answer[k] = (recipe[k]/2) * num; }
      return answer;
    }