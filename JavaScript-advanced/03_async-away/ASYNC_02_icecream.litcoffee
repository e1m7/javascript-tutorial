
Асинхронное программирование
============================

Пример про мороженое
====================

  1) разместить заказ       2 сек
  2) нарезать фрукты        2 сек
  3) добавить лед           1 сек
  4) запустить машину       1 сек
  5) выбрать стаканчик      2 сек  
  6) выбрать начинку        3 сек
  7) подать на стол         2 сек

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let order = (fruit_name, call_production) => {
      setTimeout(() => {
        console.log(`\nВыбрали фрукт: ${stocks.fruits[fruit_name]}`);
        call_production();
      }, 2000);
    };

    let production = () => {
      setTimeout(() => {
        # 1) разместить заказ
        console.log("Заказ размещен");
        # 2) нарезать фрукты
        setTimeout(() => {
          console.log("Фрукты нарезаны");
          # 3) добавить воды и льда
          setTimeout(() => {
            console.log(`Добавили ${stocks.liquid[0]} и ${stocks.liquid[1]}`);
            # 4) запустить машину
            setTimeout(() => {
              console.log("Машина запущена");
              # 5) выбрать контейнер
              setTimeout(() => {
                console.log(`Выбрали ${stocks.holder[0]}`);
                # 6) выбрать начинку
                setTimeout(() => {
                  console.log(`Выбрали ${stocks.toppings[0]}`);
                  # 7) подали на стол
                  setTimeout(() => {
                    console.log("Подали на стол");
                  }, 2000);
                }, 3000);
              }, 2000);
            }, 1000);
          }, 1000);
        }, 2000);
      }, 0000);
    };

    order(0, production);

Замечание: ситуация выше называется `callback hell`

    function1
      function2
        function3
          function4
          time4
        time3
      time2
    time1

Замечание: обычное решение этой ситуации `promices`

    function1
      .function2
      .function3
      .function4

Как работают промисы
====================

  картинка https://ibb.co/fNPQv48
  
  1) promise made (создать)
  2) promise pending (ожидать)
      3.1) resolve (выполнится нормально)
            4) .then (в нашем случае надо выполнить 7 шагов)
            5) .then (в нашем случае надо выполнить 7 шагов)
            ...
      3.2) reject (будет отклонен)
            4) .cath (перехват и обработка)
  10) .finally (завершение в любом случае)

Замечание: вариант с 3.1 произойдет, если мы выберем верные продукты
Замечание: вариант с 3.2 произойдет, если мы выберем "манго" (его нет)

  1) разместить заказ       2 сек
  2) нарезать фрукты        2 сек
  3) добавить лед           1 сек
  4) запустить машину       1 сек
  5) выбрать стаканчик      2 сек  
  6) выбрать начинку        3 сек
  7) подать на стол         2 сек

Шаг 1: выполнить через промисы 1-ую функцию
-------------------------------------------

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let is_shop_open = true;

    let order = (time, work) => {                  # определяем функцию order (время, рабочая функция)
      return new Promise((resolve, reject) => {    # функция возвращает новый промис (ок, ошибка)
        if (is_shop_open) {                        # если переменная is_shop_open == true, то...
          setTimeout(() => {                       # ...запускаем через "время" рабочую функцию
            resolve(work());                       #  
          }, time);                                #  
        } else {                                   # если переменная is_shop_open == false, то...
          reject(console.log("Магазин закрыт"));   # ...запускаем вывод на экран строки "Магазин закрыт"
        }                                          # 
      });                                          # 
    };                                             # 

    # Основной блок
    order(2000, () => {                            # вызываем фукцию order(время=2000, рабочая функция=...)
      console.log(`${stocks.fruits[0]}`)           # ...вывод на экран строки "банан" 
    });                                            # 
    # Основной блок

Замечание: сейчас начнется цепочка промисов (вызовов), у нее есть правила
Замечание: между вызова нет точки с запятой, все они идут после .then

Шаг 2: сделаем цепочку из 3 вызовов
-----------------------------------

    order(2000, () => console.log(`\nВыбор ${stocks.fruits[0]} - ок`) )
      .then(() => { return order(0000, () => console.log("Получение заказа -  ок"))})
      .then(() => { return order(2000, () => console.log("Нарезать фрукты -  ок"))})

Шаг 3: сделали цепочку из 7 вызовов
-----------------------------------

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let is_shop_open = true;

    let order = (time, work) => {
      return new Promise((resolve, reject) => {
        if (is_shop_open) {
          setTimeout(() => {
            resolve(work());
          }, time);
        } else {
          reject(console.log("Мы закрыты"));
        }
      });
    };

    order(2000, () => console.log(`\nВыбор ${stocks.fruits[0]} - ок`) )
      .then(() => { return order(0000, () => console.log("Получение заказа -  ок"))})
      .then(() => { return order(2000, () => console.log("Нарезать фрукты -  ок"))})
      .then(() => { return order(1000, () => console.log(`Добавили ${stocks.liquid[0]} и ${stocks.liquid[1]}`))})
      .then(() => { return order(1000, () => console.log("Запустить машину -  ок"))})
      .then(() => { return order(2000, () => console.log(`Выбрали ${stocks.holder[0]}`))})
      .then(() => { return order(3000, () => console.log(`Выбрали ${stocks.toppings[0]}`))})
      .then(() => { return order(2000, () => console.log("Подать на стол -  ок"))})
      
Замечание: добавим обработку ошибок catch

    let is_shop_open = false;

    order(2000, () => console.log(`\nВыбор ${stocks.fruits[0]} - ок`) )
      .then(() => { return order(0000, () => console.log("Получение заказа -  ок"))})
      .then(() => { return order(2000, () => console.log("Нарезать фрукты -  ок"))})
      .then(() => { return order(1000, () => console.log(`Добавили ${stocks.liquid[0]} и ${stocks.liquid[1]}`))})
      .then(() => { return order(1000, () => console.log("Запустить машину -  ок"))})
      .then(() => { return order(2000, () => console.log(`Выбрали ${stocks.holder[0]}`))})
      .then(() => { return order(3000, () => console.log(`Выбрали ${stocks.toppings[0]}`))})
      .then(() => { return order(2000, () => console.log("Подать на стол -  ок"))})
      .catch(() => console.log("Ваш заказ отменен"))

Замечание: добавим обработку "в любом случае" finally

    order(2000, () => console.log(`\nВыбор ${stocks.fruits[0]} - ок`) )
      .then(() => { return order(0000, () => console.log("Получение заказа -  ок"))})
      .then(() => { return order(2000, () => console.log("Нарезать фрукты -  ок"))})
      .then(() => { return order(1000, () => console.log(`Добавили ${stocks.liquid[0]} и ${stocks.liquid[1]}`))})
      .then(() => { return order(1000, () => console.log("Запустить машину -  ок"))})
      .then(() => { return order(2000, () => console.log(`Выбрали ${stocks.holder[0]}`))})
      .then(() => { return order(3000, () => console.log(`Выбрали ${stocks.toppings[0]}`))})
      .then(() => { return order(2000, () => console.log("Подать на стол -  ок"))})
      .catch(() => console.log("Ваш заказ отменен"))
      .finally(() => console.log("Приходите к нам еще"))