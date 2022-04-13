
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 12: детская книга
========================

Задача: проанализуем строки детской книги


Шаг 1: внесем данные, натренируем есть
======================================

    const trainingData = [
        'Alice say Bob',
        'Bob say Alice',
        'Alice, Bob and Marina walking of the street',
        'Marina love young boy and drinking beer'
    ];

    const net = new brain.recurrent.LSTM();
    net.train(trainingData, {
        iterations: 1500,
        errorThresh: 0.01,
        log: (stats) => console.log(stats)
    });

Замечание: iterations: 1490, training error: 0.01081539582055235


Шаг 2: проверка сети
====================

    console.log(net.run('Alice'));
    console.log(net.run('walking in the'));

Замечание: сеть найдет последнее вхождение фразы, выведт строку до конца
Замечание: 1) , Bob and Marina walking in the street
Замечание: 2) street


САМОСТОЯТЕЛЬНАЯ РАБОТА:
=======================

  1) Взять в качестве данных 5-6 строк А.С.Пушкина
  2) Проверить как будет работать сеть с русским текстом

