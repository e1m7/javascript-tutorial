
Лекция 6: массивы
=================

Вводные понятия
===============

1) Массив это структура типа список без фиксированной длины
2) Массив может содержать любые типы данных (даже объекты)
3) У массива много встроенных свойств и методов (например, length)
4) Для создания массива let a = [];
5) Для обращения к элементу a[10]
6) Индекс массива начинается с 0

Примеры
=======

    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    names[1];

Замечание: массив можно создавать как экземпляр класса Array

    const names = new Array();
    names.push('Jack', 'Laura', 'Paul', 'Megan');
    names[1];

Сложное замечание: 

  1) индекс массива всегда число
  2) обращатся к элементу всегда через []
  3) массив != объект, нельзя в него поместить что-то через точку
  4) (на самом деле можно) это будет свойство переменной, но не новый элемент

    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(names);
    console.log(names.length);

    names.girl = 'Elyse';
    console.log(names);
    console.log(names.length);
    console.log(names.girl);

    console.log(Object.keys(names));
    names.forEach((name) => console.log(name));

Замечание: элементы можно удалять, но остальные не "поджимаются"
Замечание: внутри массива будут "дырки", они пропускаются при обходе

    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(names);
    console.log(names.length);
    delete names[1];
    console.log(names);
    console.log(names.length);

Замечание: если надо сохранить правильную длину и последовательность = splice
Замечание: splice добавляет|удаляет элементы, сохраняя целостность

    # удаление
    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(names);
    console.log(names.length);
    names.splice(1, 1);
    console.log(names);
    console.log(names.length);

    # добавление
    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(names);
    console.log(names.length);
    names.splice(1, 1, 'Ivan');
    console.log(names);
    console.log(names.length);

Замечание: длину массива можно изменить

  1) если увеличить, то добавлятся пустые элементы
  2) если уменьшить, то элементы удалятся

    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(names);
    console.log(names.length);
    names.length = 2;
    console.log(names);
    console.log(names.length);

Замечание: массив это объект, проверка typeof даст "object"
Замечание: чтобы проверить, что объект == массив Array.isArray(name);

    const names = ['Jack', 'Laura', 'Paul', 'Megan'];
    console.log(typeof names);
    console.log(Array.isArray(names));

    const users = {
        name: "Alexey",
        age: 20
    }
    console.log(Array.isArray(users));

Специальные методы массива
==========================

  Метод push
  ==========

  1) push заталкивает 1-2-3... объектов в конец массива
  2) push возвращает новую длину массива
  3) push меняет длину массива

    let num = [1,2,3,4,5,6];
    console.log(num);
    # num.push(100);
    # console.log(num);
    let newlen = num.push(100);
    console.log(num, newlen);

  Метод pop
  =========

  1) pop удаляет последний элемент из массива
  2) pop возвращает его 
  3) pop меняет длину массива

    let num = [1,2,3,4,5,6];
    console.log(num);
    let last = num.pop();
    console.log(num);
    console.log(last);

  Метод shift
  ===========

  1) shift удаляет первый элемент массива
  2) shift возвращает его

  Метод unshift
  =============

  1) unshift добавляет 1-2-3... элементов в начало
  2) unshift возвращает новую длину массива

  Метод splice
  ============

  1) splice изменяет содержимое массива
  2) удаляет элементы | заменяет элементы
  3) splice возвращает массив = удаленным элементам

    let num = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
    let a = num.splice(5,3,'Masha')
    console.log(num);
    console.log(a);


Задача 6 "Elyses Enchantments"
==============================

  Задача: создать 1-8 функции обработки массивов

    // 1) получить значение массива cards с позиции position
    export function getItem(cards, position) {
      return cards[position];
    }

    // 2) заменить значение массива cards в позиции position на replacementCard
    export function setItem(cards, position, replacementCard) {
      cards[position] = replacementCard;
      return cards;
    }

    // 3) вставить значение newCard в конец массива cards
    export function insertItemAtTop(cards, newCard) {
      cards.push(newCard);
      return cards;
    }

    // 4) удалить значение массива cards в позиции position
    export function removeItem(cards, position) {
      cards.splice(position, 1);
      return cards;
    }

    // 5) удалить элемент с конца массива cards
    export function removeItemFromTop(cards) {
      cards.pop();
      return cards;
    }

    // 6) вставить значение newCard в начало массива cards
    export function insertItemAtBottom(cards, newCard) {
      cards.unshift(newCard);
      return cards;
    }

    // 7) удалить значение из начала массива
    export function removeItemAtBottom(cards) {
      cards.shift();
      return cards;
    }

    // 8) сравнить размер массива  с числом stackSize
    export function checkSizeOfStack(cards, stackSize) {
      return cards.length === stackSize;
    }
