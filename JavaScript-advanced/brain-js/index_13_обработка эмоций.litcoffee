
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 13: обработка эмоций
===========================

Задача: попробуем научить сеть искать эмоции

    const trainingData = [
        { input: 'I am super happy!', output: 'happy' },   // Я очень счастлив = счастливый
        { input: 'What a pill!', output: 'sarcastic' },    // Что за пилюля? = саркастический
        { input: 'I am super unhappy', output: 'sad' },    // Я очень несчастлив = грусный
        { input: 'Are we there yet?', output: 'excited' }, // Мы уже пришли? = взволнованный
    ];

    const net = new brain.recurrent.LSTM();
    net.train(trainingData, {
        iterations: 100,
        errorThresh: 0.011,
        log: (error) => console.log(error)
    });

    console.log(net.run('I am unhappy'));


САМОСТОЯТЕЛЬНАЯ РАБОТА:
=======================

  1) добавить 5 новых эмоций
  2) протестировать сеть