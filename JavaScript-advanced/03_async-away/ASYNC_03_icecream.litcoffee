
Асинхронное программирование
============================

Как работает async / away
=========================

Удалим все, кроме начальных переменных

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let is_shop_open = true;

Замечание: в промисах мы обрабатывает три варианта: 1) все ок, 2) ошибка, 3) в любом случае
Замечание: "все ок" обрабатываться через последующий вызов .then() или просто код ниже
Замечание: "ошибка" обрабатывается через .catch (вызов функции для ошибки)
Замечание: "в любом случае" обрабатывается через .finally (вызов функции для нее)
Замечание: async/away позволяет обработать все три случая внутри функции

Простейшая await-функция
========================

    async function order() {
      try {
        await sample;
      } 
      catch (error) {
        console.log(`Была ошибка: ${error}`)
      }
      finally{
        console.log("Выполнилось в любом случае")
      }
    };

    order();

Замечание: функция попробовала вызвать функцию sample(), а ее нет
Замечание: функция сгенерила ошибку и ее перехватил cath()
Замечание: функция finally() вывела в конце работы некую строку
Замечание: на функцию order() можно навешивать .then()

    order()
      .then(() => console.log("Большое второе дело"))

Мини-задача про кухню
=====================

Замечание: на кухне идут работы A-B-C-D-E, их делает повар друг за другом
Замечание: после С повар выходит из функции (кухни), чтобы спросить про посыпку
Замечание: вся работа на кухне встает, но работа в зале продолжается
Замечание: когда повар возвращается на кухню, доделывается D-E

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let is_shop_open = true;

    let select_toppings = () => {
      return new Promise((res, rej) => {
        setTimeout(() => {
          res(console.log("Выбрана посыпка"))
        }, 3000);
      });
    }

    async function kitchen() {
      console.log(" A ");
      console.log(" B ");
      console.log(" C ");

      await select_toppings();

      console.log(" D ");
      console.log(" E ");
    }

    kitchen();
    console.log("Протереть столы");
    console.log("Протереть посуду");
    console.log("Вымыть пол");


Наша старая задача про фургон мороженого
========================================

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let is_shop_open = true;

    function time(ms) {
      return new Promise((res, rej) => {
        if (is_shop_open) {
          setTimeout(res, ms);
        } else {
          rej(console.log("Выходной день"));
        }
      });
    }

    async function kitchen() {
      try {
        await time(2000); console.log(`\nФрукт ${stocks.fruits[0]} выбран - ок`);
        await time(1000); console.log("Заказ начат - ок");
        await time(2000); console.log("Фрукты порезаны - ок");
        await time(1000); console.log("Вода и лед - ок");
        await time(1000); console.log("Машина включена - ок");
        await time(2000); console.log(`Контейнер ${stocks.holder[0]} выбран - ок`);
        await time(3000); console.log(`Посыпка ${stocks.toppings[0]} выбрана - ок`);
        await time(2000); console.log("Мороженое подано - ок");
      }
      catch(error) { console.log("Произошла ошибка: " + error) }
      finally { console.log("Магазин закрыт") }
    }

    kitchen();