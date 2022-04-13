
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 8: нормализация, часть 2
===============================

Данные реального датасета: https://t.ly/brVR


Шаг 1: возьмем реальные данные
==============================

    # данные фондовой биржи
    const rawDate = [
        { open: 24.333, high: 24.333, low: 23.946, close: 23.946 },
        { open: 24.644, high: 24.644, low: 24.362, close: 24.487 },
        { open: 24.759, high: 24.759, low: 24.314, close: 24.507 },
        { open: 24.624, high: 24.624, low: 24.449, close: 24.595 },
        { open: 24.477, high: 24.517, low: 24.431, close: 24.517 },
        { open: 24.477, high: 24.517, low: 24.352, close: 24.431 },
        { open: 24.527, high: 24.527, low: 24.256, close: 24.256 },
        { open: 24.228, high: 24.333, low: 24.228, close: 24.333 },
        { open: 24.916, high: 24.926, low: 24.664, close: 24.839 },
        { open: 24.966, high: 25.069, low: 24.966, close: 25.042 },
        { open: 25.069, high: 25.069, low: 25.069, close: 25.069 },
        { open: 25.118, high: 25.118, low: 25.118, close: 25.118 },
        { open: 24.537, high: 24.926, low: 24.537, close: 24.926 },
        { open: 25.207, high: 25.429, low: 25.207, close: 25.265 },
        { open: 25.285, high: 25.285, low: 25.285, close: 25.285 },
        { open: 24.401, high: 24.401, low: 24.401, close: 24.401 },
        { open: 24.276, high: 24.276, low: 24.276, close: 24.276 },
        { open: 24.401, high: 24.401, low: 24.401, close: 24.401 },
        { open: 24.507, high: 24.507, low: 24.467, close: 24.467 },
        { open: 24.789, high: 24.966, low: 24.789, close: 24.966 }
    ];

    # функция нормализации
    function scaleDown(step) {
        return {
            open: step.open / 24,
            high: step.high / 24,
            low: step.low / 24,
            close: step.close / 24
        };
    };

    # функция де-нормализации
    function scaleUp(step) {
      return {
            open: step.open * 24,
            high: step.high * 24,
            low: step.low * 24,
            close: step.close * 24
      };  
    };

    # scaleData = массив rawDate, пропущенынй через функцию scaleDown
    const scaleData = rawDate.map(scaleDown);

    # тренировочные данные
    const trainingData = [
        scaleData.slice(0, 5),
        scaleData.slice(5, 10),
        scaleData.slice(10, 15),
        scaleData.slice(15, 20)
    ];

    # вывод данных на экран
    console.log(trainingData);


Шаг 2: тренируем сеть
=====================

    const net = new brain.recurrent.LSTMTimeStep({

        inputSize: 4,                         # данных на входе = 4
        hiddenLayers: [8,8],                  # скрытых слоев = 8 слоев по 8 штук
        outputSize: 4,                        # данных на выходе = 4

    });

    net.train(trainingData, {

        learningRate: 0.005,                  # шаг приращения = 0.005 (мало)
        errorThresh: 0.02,                    # ошибка = 0.02 (маленькая)
        log: (stats) => console.log(stats)    # вывод статистики 

    });   


Шаг 3: проверим данные для 1-ой записи 1-ой записи
==================================================

    console.log(scaleUp(trainingData[0][0]));