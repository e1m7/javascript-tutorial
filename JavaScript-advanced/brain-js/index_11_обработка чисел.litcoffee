
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 11: обработка чисел
==========================

Задача: обучим нейронную сеть понимаеть рисунки цифр

Шаг 1: обработаем данные
========================

        # нормализация входных данных
        function toArray(string) {
            if (string.length !== 7*7) throw new Error('String wrong size');     
            return string.split('').map(toNumber);
        };

        # обработка символов: 1 если #, 0 если другой
        function toNumber(character) {
            return character === '#' ? 1 : 0;
        };

        const zero = toArray(
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#     #' + 
            '#     #' + 
            '#     #' + 
            '#######'
        );

        const one = toArray(
            '   #   ' + 
            '   #   ' + 
            '   #   ' + 
            '   #   ' + 
            '   #   ' + 
            '   #   ' + 
            '   #   '
        );

        const two = toArray(
            '#######' + 
            '      #' + 
            '      #' + 
            '#######' + 
            '#      ' + 
            '#      ' + 
            '#######'
        );

        const three = toArray(
            '#######' + 
            '      #' + 
            '      #' + 
            '#######' + 
            '      #' + 
            '      #' + 
            '#######'
        );

        const four = toArray(
            '#     #' + 
            '#     #' + 
            '#     #' + 
            '#######' + 
            '      #' + 
            '      #' + 
            '      #'
        );

        const five = toArray(
            '#######' + 
            '#      ' + 
            '#      ' + 
            '#######' + 
            '      #' + 
            '      #' + 
            '#######'
        );

        const six = toArray(
            '#######' + 
            '#      ' + 
            '#      ' + 
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######'
        );

        const seven = toArray(
            '#######' + 
            '     # ' + 
            '    #  ' + 
            '   #   ' + 
            '  #    ' + 
            ' #     ' + 
            '#      '
        );

        const eight = toArray(
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######'
        );

        const nine = toArray(
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######' + 
            '      #' + 
            '      #' + 
            '#######'
        );

        console.log(nine);


Шаг 2: обучим сеть
==================

        const net = new brain.NeuralNetwork();
        const trainigData = [
            { input: zero, output: { zero: 1 } },
            { input: one, output: { one: 1 } },
            { input: two, output: { two: 1 } },
            { input: three, output: { three: 1 } },
            { input: four, output: { four: 1 } },
            { input: five, output: { five: 1 } },
            { input: six, output: { six: 1 } },
            { input: seven, output: { seven: 1 } },
            { input: eight, output: { eight: 1 } },
            { input: nine, output: { nine: 1 } }
        ];
        net.train(trainigData, { log: (stats) => console.log(stats) });

Замечание: {error: 0.0051138819689533965, iterations: 320}

Шаг 3: тестируем работу сети
============================

        const result = net.run(toArray(
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######'
        ));

        console.log(result);

Замечание: 89% что это 8


        const result = net.run(toArray(
            '###### ' + 
            '      #' + 
            '      #' + 
            '###### ' + 
            '      #' + 
            '      #' + 
            '###### '
        ));

        console.log(result);

Замечание: 85% что это 3

Шаг 4: более простое получение результата
=========================================

        const result = brain.likely(toArray(
            '#######' + 
            '#      ' + 
            '#      ' + 
            '#######' + 
            '#     #' + 
            '#     #' + 
            '#######'
        ), net);

        console.log(result);

Замечание: насколько сеть прочна, можно ли испортить данные не потеряв работу?
Замечание: убрать 1 символ, 2 символа, 3 символа...

        const result = brain.likely(toArray(
            ' ##### ' + 
            '#      ' + 
            '#      ' + 
            '###### ' + 
            '#     #' + 
            '#     #' + 
            ' ##### '
        ), net);

        console.log(result);

Замечание: работает без 5 ключевых нейронов