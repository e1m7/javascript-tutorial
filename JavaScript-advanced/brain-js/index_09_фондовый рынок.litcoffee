
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 9: фондовый рынок
========================

1) Мы всегда просили сеть предсказать 1 событие на основе данных
2) Сейчас мы попросим ее на основе 2 событий предсказать следующее


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

    const scaleData = rawDate.map(scaleDown);

    # тренировочные данные
    const trainingData = [
        scaleData.slice(0, 5),
        scaleData.slice(5, 10),
        scaleData.slice(10, 15),
        scaleData.slice(15, 20)
    ];

    const net = new brain.recurrent.LSTMTimeStep({
        inputSize: 4,
        hiddenLayers: [8,8],
        outputSize: 4,
    });

    net.train(trainingData, {
        learningRate: 0.005,
        errorThresh: 0.02
    });

    # предсказать три события (1,2 из набора, 3 что после них)

    console.log(net.forecast([         # 1) выведи в консоль предсказание
        trainingData[0][0],            # 2) данные из 0-го набора 0-ая запись
        trainingData[0][1],            # 3) данные из 0-го набора 1-ая запись
    ], 3).map(scaleUp));               # 4) но всего их предскажи 3 штуки

    # предсказать три события (1,2 из набора, 3 что после них)


  [
    { open: 24.441824913024902, 
      high: 24.49043369293213, 
      low: 24.33915138244629, 
      close: 24.462060928344727 }, 

    { open: 24.598877906799316, 
      high: 24.73794937133789, 
      low: 24.536513328552246, 
      close: 24.69587230682373 }, 

    { open: 24.67430019378662, 
      high: 24.787997245788574, 
      low: 24.656441688537598, 
      close: 24.783522605895996 }
  ]

  const rawDate = [
      { open: 24.333, high: 24.333, low: 23.946, close: 23.946 },
      { open: 24.644, high: 24.644, low: 24.362, close: 24.487 },
      { open: 24.759, high: 24.759, low: 24.314, close: 24.507 },


Замечание: в наборе 20 записей, мы использовали 2