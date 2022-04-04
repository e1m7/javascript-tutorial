
Лекция 22-23: деструктуризация массива ❤
======================================

Вводные понятия
===============

1) Деструктуризация это извлечение из массива данных в переменные

    const numberOfMoons = [0, 2, 14];
    const [venus, mars, neptune] = numberOfMoons;

    console.log(neptune);

Оператор ... слева
==================

Замечание: в JavaScript есть оператор ... (три точки)
Замечание: ... работает с неопределенынм количеством элементов
Замечание: ... либо работает с остатком, либо с расширением массива

    # так вполне работает
    const [a, b, ...otherElem] = [0, 1, 1, 2, 3, 5, 8];
    console.log(a);
    console.log(b);
    console.log(otherElem);

    # нет, так не будет работать!
    const [...items, last] = [2, 4, 8, 16];

Замечание: ... работает с объектами

    const { street, ...address } = {
      street: 'Platz der Republik 1',
      postalCode: '11011',
      city: 'Berlin',
    };

    console.log(street);
    console.log(address);

Замечание: ... можно использовать в функции, в него собираются все параметры

    function concat(...strings) {
      return strings.join(' ');
    }

    console.log(concat('one'));
    console.log(concat('one', 'two', 'three'));

Оператор ... справа
===================

Замечание: ... справа может появляться где угодно, он расширяет список

    const oneToFive = [1, 2, 3, 4, 5];
    const oneToTen = [...oneToFive, 6, 7, 8, 9, 10];
    console.log(oneToTen);

    const woow = ['A', ...oneToFive, 'B', 'C', 'D', 'E', ...oneToFive, 42];
    console.log(woow);

Замечание: ... может копировать свойства из объекта => объект

    let address = {
      postalCode: '11011',
      city: 'Berlin',
    };

    address = { ...address, country: 'Germany' };
    console.log(address);


Задача 21-22 "Elyses Destructured Enchantments"
===============================================

  Задача: волшебница Элиза и ее 1-10 карты

    // вернуть 1-ую карту без arr[index], shift()
    export function getFirstCard(deck) {
      let [first] = deck;
      return first;
    }

    // вернуть 2-ую карту без arr[index], shift()
    export function getSecondCard(deck) {
      let [first, second] = deck;
      return second;
    }

    // поменять местами 1 <=> 2 карту
    export function swapTopTwoCards(deck) {
      let [first, second, ...other] = deck;
      deck = [second, first, ...other];
      return deck;
    }

    // разделить колоду на 1 и остальные
    export function discardTopCard(deck) {
      let [first, ...other] = deck;
      deck = [first, other];
      return deck;
    }

    const FACE_CARDS = ['jack', 'queen', 'king'];

    // вставить валет, дама, король со 2-ой карты
    export function insertFaceCards(deck) {
      let [first, ...other] = deck;
      deck = [first, ...FACE_CARDS, ...other];
      return deck;
    }