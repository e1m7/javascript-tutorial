
Асинхронное программирование
============================

Что такое асинхронное программирование
======================================

1) АП это разбиение больших задач на подзадачи
2) АП = callback || promises || async/away

Пример: как приготовить мороженое?

  1) разместить заказ       2 сек
  2) нарезать фрукты        2 сек
  3) добавить лед           1 сек
  4) запустить машину       1 сек
  5) выбрать стаканчик      2 сек  
  6) выбрать начинку        3 сек
  7) подать на стол         2 сек

3) АС = когда 10 картинок загружаются вместе, а не друг за другом
4) АС = когда 3 бегуна бегут по 3 дорожкам, а не по 1-ой друг за другом

    # Вариант 1: синхронная система
    console.log(" I ");
    console.log(" eat ");
    console.log(" ice cream ");
    console.log(" with a ");
    console.log(" spoon ");

Замечание: мы будем использовать асинхронную функцию setTimeout()

  1) функция, которая будет выполнена 
  2) время, через которое она будет выполнена

    # Вариант 2: а-синхронная система
    console.log(" I ");
    console.log(" eat ");

    setTimeout(() => {
      console.log(" ice cream ");
    }, 3000);

    console.log(" with a ");
    console.log(" spoon ");


Что такой callback
==================

1) Callback это вызов одной функции внутри второй функции
2) Между такими функциями устанавливается особая связь

Задача: создадим две функции

    # Шаг 1: создадим две фунции, вызовем первую
    function one() {
      console.log("Step 1");
    }

    function two() {
      console.log("Step 2");
    }

    one();

    # Шаг 2: вызовем первую, потом вторую
    function one() {
      console.log("Step 1");
    }

    function two() {
      console.log("Step 2");
    }

    one();
    two();

    # Шаг 3: вызове вторую, потом первую
    function one() {
      console.log("Step 1");
    }

    function two() {
      console.log("Step 2");
    }

    two();
    one();

    # Шаг 4: вызовем вторую функцию из первой
    function one(call_two) {
      console.log("Step 1 complete. Call step 2");
      call_two();
    }

    function two() {
      console.log("Step 2");
    }

    one(two);

    # Шаг 5: изменим порядок строк внутри первой функции
    function one(call_two) {
      call_two();
      console.log("Step 1 complete. Call step 2");
    }

    function two() {
      console.log("Step 2");
    }

    one(two);

Как происходит работа грузовика мороженого
==========================================

  1) получаем заказ         function 1
  2) берем ингридиенты      function 2
  3) готовим мороженое      function 3 
  4) отдаем заказ           function 4

Пример: работа магазина мороженого

Шаг 1: создадим основные фукнции
--------------------------------

    # функция получения заказа
    let order = (call_production) => {
      console.log("заказ сделан, начинайте производство");
      call_production();
    };

    # функция приготовления товара
    let production = () => {
      console.log("производство начато");
    };

    # вызов функции получения заказа с аргументом = функции приготовления
    order(production); 

Замечание: внутри магазина есть кухня (front-end)
Замечание: внутри магазина есть склад (back-end)

  Fruits
    1) банан
    2) яблоко
    3) клубника
    4) виноград

  Holder
    5) рожок
    6) стаканчик
    7) палочка

  Toppings
    8) шоколад
    9) крошка

Шаг 2: сделаем разбиение на кухню и склад
-----------------------------------------

    # Backend
    # Backend
    # Backend

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    # Frontend
    # Frontend
    # Frontend

    let order = (call_production) => {
      call_production();
    };

    let production = () => {
    };

    # order(production);
    console.log(stocks.fruits[1]);    


Воспоминание: как приготовить мороженое?

  1) разместить заказ       2 сек
  2) нарезать фрукты        2 сек
  3) добавить лед           1 сек
  4) запустить машину       1 сек
  5) выбрать стаканчик      2 сек  
  6) выбрать начинку        3 сек
  7) подать на стол         2 сек

Шаг 3: дадим возможность делать заказ с выбором фруктов
-------------------------------------------------------

Замечание: на выбор дается 2 секунды

    # Backend

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    # Frontend

    let order = (fruit_name, call_production) => {

      setTimeout(() => {
        console.log(`${stocks.fruits[fruit_name]}`);
      }, 2000);

      call_production();
    };

    let production = () => {
    };

    order(0, production);

Замечание: функция приготовления срабатывает через 0 секунд
Замечание: надпись о начале выполнения придет раньше выбора фрукта (не хорошо)

    let stocks = {
      fruits: ['банан','яблоко','клубника','виноград'],
      liquid: ['вода','лед'],
      holder: ['рожок','стаканчик','палочка'],
      toppings: ['шоколад','крошка']
    };

    let order = (fruit_name, call_production) => {

      setTimeout(() => {
        console.log(`${stocks.fruits[fruit_name]}`);
      }, 2000);
      call_production();
    };

    let production = () => {
      setTimeout(() => {
        console.log("\nЗаказ получен, выполнение началось");
      }, 0000);
    };

    order(0, production);

Шаг 4: сделаем так, чтобы выполнение началось после выбора фрукта
-----------------------------------------------------------------

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
        console.log("Заказ получен, выполнение началось");
      }, 0000);
    };

    order(0, production);

Шаг 5: нарезать фрукты
----------------------

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
        // 1) разместить заказ
        console.log("Заказ размещен");
        // 2) нарезать фрукты
        setTimeout(() => {
          console.log("Фрукты нарезаны");
        }, 2000);
      }, 0000);
    };

    order(0, production);

Шаг 6: добавить воду и лед
--------------------------

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
          }, 1000);
        }, 2000);
      }, 0000);
    };

    order(0, production);

Шаг 7: запустить машину
-----------------------

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
            }, 1000);
          }, 1000);
        }, 2000);
      }, 0000);
    };

Шаг 7: выбрать контейнер
------------------------

Замечание: контейнеров под мороженое 3 штуки

  1) разместить заказ       2 сек
  2) нарезать фрукты        2 сек
  3) добавить лед           1 сек
  4) запустить машину       1 сек
  5) выбрать стаканчик      2 сек  
  6) выбрать начинку        3 сек
  7) подать на стол         2 сек

  Holder
    5) рожок
    6) стаканчик
    7) палочка

Замечание: для простоты (пока) пусть это будет рожик, индекс=0

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
              }, 2000);
            }, 1000);
          }, 1000);
        }, 2000);
      }, 0000);
    };

Шаг 8: выбрали начинку (посыпку)
--------------------------------

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
                }, 3000);
              }, 2000);
            }, 1000);
          }, 1000);
        }, 2000);
      }, 0000);
    };

Шаг 9: подали на стол
---------------------

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
