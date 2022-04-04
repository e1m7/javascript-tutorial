
Функциональное програмирование: функции высшего порядка
=======================================================

Замыкания
=========

1) В JavaScript функции это переменные (высшего порядка)
2) В JavaScript функции это еще замыкания

Замыкание это свойство: тело функции имеет доступ к переменным вне функции

    # Вариант с замыканием
    const name = "Homer Simpson";

    function greeting() {
        console.log("Hello " + name + " how are you?");
    }

    greeting();

3) Видно, что greeting() не получает name как параметр (нет параметров)
4) Говорят, что greeting() замкнута на переменную name (замыкание)

Замечание: если бы поддержки замыкания не было, то код был бы такой

    # Вариант без замыкания
    function greeting(name) {
        console.log("Hello " + name + " how are you?");
    }

    greeting("Homer Simpson");

Замечание: в чем полезность замыканий, зачем они нужны?

    # index.html
    <html>
        <head>
            <script src="index.pack.js"></script>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        </head>
        <body>
            <div id="box"></div>
        </body>
    </html>

    # index.js
    function send_request() {
        const request_id = "123";
        $.ajax({
            url: 'localhost',
            success: function(res) {
                alert('Request ' + request_id + ' return ');     // ответ (запрос прошел)
                console.log(res);                                // ответ (тело ответа)
            }
        });
    };

    send_request();

Замечание: удобство в том, что в функцию success не надо передавать 123
Замечание: в силу замыкания функция сама вытащит данные, которые ей нужны


Каррирование
============

1) Каррирование это трансформация функций, чтобы они принимали аргументы по другому
2) f(a, b, c) => f(a)(b)(c), каррирование не вызывает функцию, а переделывает ее

    # index.js
    const dragon = (name, size, element) => 
        name + " is a terrable dragon, " +
        size + " man kill of " +
        element + "!"
        
    console.log(dragon("Drogan", "100", "fire"));

    # index.js (после каррирования)
    const dragon =
        name =>
            size => 
                element => 
                    name + " is a terrable dragon, " +
                    size + " man kill of " +
                    element + "!"
        
    console.log(dragon("Drogan")("100")("fire"));

Плюсы каррирования

  1) Все функции внутри каррирования получаются с 1-им аргументом
  2) Все функции из-за замыкания "видят" друг друга и не теряют данные
  3) Последняя функция внутри каррирования вернет правильный ответ

Пример: умножение трех переменных

    # без каррирования
    function multiply(a, b, c) {
        return a * b * c;
    }

    console.log(multiply(1, 2, 3));

    # с каррированием
    function multiply(a) {
        return (b) => {
            return (c) => {
                return a * b * c
            }
        }
    }
    
    # запуск одним вызовом
    log(multiply(1)(2)(3))

    # запуск по шагам
    const mul1 = multiply(1);
    const mul2 = mul1(2);
    const result = mul2(3);
    log(result);

Пример: допустим, что у нас в магазине есть функция вычисления суммы со скидкой

    # Функция для расчета скидки
    function discount(price, discount) {
        return price * discount
    }

    # скидка 10%
    const price = discount(500,0.10); // $50 
    const price = discount(100,0.10); // $10 

    Замечание: при работе все время надо будет вызывать функцию с 2-мя параметрами
    Замечание: можно упростить (каррировать) функцию, чтобы передавать только price

    # Каррированная функция для расчета скидки
    function discount(discount) {
        return (price) => {
            return price * discount;
        }
    }
    
    const tenPercentDiscount = discount(0.1);

    # Покупатель купил товар на 500$
    # C 10% скидкой он должен оплатить

    tenPercentDiscount(500);            // 450$
    tenPercentDiscount(100);            // 90$

    Замечание: если надо рассчитать 20% скидку, то исправим 1 параметр

    const twentyPercentDiscount = discount(0.2);

    # Покупатель купил товар на 500$
    # C 20% скидкой он должен оплатить

    tenPercentDiscount(500);            // 400$
    tenPercentDiscount(100);            // 80$