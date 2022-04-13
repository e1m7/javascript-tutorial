
Нейронные сети на основе библиотеки Brain.js
============================================

Лекция 14: RNN recurrent neural network
=======================================

1) рекуррентные сети при получении данных создают карту
2) в карту входят как входящие данные, так и исходящие (пример про 1+1=2)
3) входящие и исходящие данные это нейроны, каждый представлен как набор 0-1
4) как формируется карта? как она растет?


Теоретическая задача
====================

Допустим, что у нас есть данные

		const trainingData = [
		    { input: 1, output: 2 }
		];

		const net = new brain.NeuralNetwork();
		const inputMap = ['1', '2'];

Замечание: карта состоит из двух нейронов 1 и 2? (нет, это не так)
Замечание: в реальности в карте будет еще один нейрон (промежуточный)

		const inputMap = ['1', 'NEW IDEA', 2'];
		
		1 => NEW IDEA => 2

		[1,0,0] = 1
		[0,1,0] = NEW IDEA
		[0,0,1] = 2

Замечание: допустим, наша строка = { input: 2, output: 1 }


		const trainingData = [
		    { input: 2, output: 1 }
		];

		[0,0,1] = 2
		[0,1,0] = NEW IDEA
		[1,0,0] = 1


Реальная задача
===============

Допустим, у нас два наблюдения: 1) 0,0 => 0, 2) 0,1 => 1


		const trainingData = [
		    { input: [0,0], output: [0] },
		    { input: [0,1], output: [1] }
		];

		const net = new brain.NeuralNetwork({ hiddenLayers: [3] });
		net.train(trainingData, {
		    log: (error) => console.log(error)
		});

		console.log(net.run([0,0]));
		console.log(net.run([0,1]));

Замечание: нам возвращается целочисленный массив, надо преобразовать его в число

		console.log(Array.from(net.run([0,0])));
		console.log(Array.from(net.run([0,1])));

Замечание: ответ = 0 и 1
Замечание: попробуем добавить новый пример [1,0], даст ли он 1?

		САМОСТОЯТЕЛЬНАЯ РАБОТА
		======================


		const trainingData = [
		    { input: [0,0], output: [0] },
		    { input: [0,1], output: [1] }
		];

		const net = new brain.NeuralNetwork({ hiddenLayers: [3] });
		net.train(trainingData);

		console.log('Предсказания для 00=0, 01=1, 10=1?');
		console.log(Array.from(net.run([0,0])));
		console.log(Array.from(net.run([0,1])));
		console.log(Array.from(net.run([1,0])));

		trainingData.push({ input: [1,0], output: [1] });
		net.train(trainingData);

		console.log('Предсказания для 00=0, 01=1, 10=1?');
		console.log(Array.from(net.run([0,0])));
		console.log(Array.from(net.run([0,1])));
		console.log(Array.from(net.run([1,0])));