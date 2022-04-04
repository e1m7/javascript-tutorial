
Функциональное програмирование: функции высшего порядка
=======================================================

Функция filter
==============

Простая функция

    function triple(x) {
      return x * 3;
    }

Простая функция, помещенная в переменную

    const triple = function (x) {
      return 3 * x;
    }

    const other = triple;
    console.log(other(30));

Пример: есть массив животных, мы хотим отфильтровать собак

    # Вариант: простое обычное программирование
    const animals = [
        {name: "Персик", classtype: "кошка"},
        {name: "Трезор", classtype: "собака"},
        {name: "Мурзик", classtype: "кошка"},
        {name: "Чижик", classtype: "птица"},
        {name: "Бобик", classtype: "собака"}
    ];

    const dogs = [];
    for (var i = 0; i < animals.length; i++) {
        if (animals[i].classtype == 'собака') {
            dogs.push(animals[i]);
        }
    }
    console.log(dogs);

    # Вариант: функция filter (фильтрация)
    const animals = [
        {name: "Персик", classtype: "кошка"},
        {name: "Трезор", classtype: "собака"},
        {name: "Мурзик", classtype: "кошка"},
        {name: "Чижик", classtype: "птица"},
        {name: "Бобик", classtype: "собака"}
    ];

    const dogs = animals.filter(function(a) {
        return a.classtype == 'собака';
    })
    console.log(dogs);    

Замечание: как работает функция filter?

    1) она проходит по массиву animals
    2) она передает каждый элемент (безымянной) функции 
    3) если функция возвращает true => добавим элемент в dogs
    4) если функция возвращает false => 

Замечание: безымянную функцию можно положить в переменную

    const isDog = function(a) {
        return a.classtype == 'собака';
    }

    const dogs = animals.filter(isDog);
    console.log(dogs)


Функция map
===========

Замечание: как работает функция map?

    1) она проходит по массиву
    2) она применяет функцию к каждому элементу
    3) она возвращает новый массив измененых элементов

Пример: есть массив животных, мы хотим создать массив их имен

    # Вариант 1: простое обычное программирование
    const animals = [
        {name: "Персик", classtype: "кошка"},
        {name: "Трезор", classtype: "собака"},
        {name: "Мурзик", classtype: "кошка"},
        {name: "Чижик", classtype: "птица"},
        {name: "Бобик", classtype: "собака"}
    ];

    const names = [];
    for (var i = 0; i < animals.length; i++) {
        names.push(animals[i].name);
    }
    console.log(names);

    # Вариант 2: функция map
    const animals = [
        {name: "Персик", classtype: "кошка"},
        {name: "Трезор", classtype: "собака"},
        {name: "Мурзик", classtype: "кошка"},
        {name: "Чижик", classtype: "птица"},
        {name: "Бобик", classtype: "собака"}
    ];

    const names = animals.map(function(a) {
        return a.name;
    })
    console.log(names);

Замечание: при создании элементов можно комбинировать

    const names = animals.map(function(a) {
        return a.name + " это есть " + a.classtype;
    })
    console.log(names);

Замечание: при создании элементов можно использовать =>

    const names = []; for (var i = 0; i < animals.length; i++) { names.push(animals[i].name); }
    const names = animals.map(function(a) { return a.name; })
    const names = animals.map( (a) => a.name )
    const names=animals.map((a)=>a.name)

# 1) 91 символ      через циклы
# 2) 57 символов    функциональный стиль
# 3) 42 символа     функциональный стиль стрелочка
# 4) 36 символов    функциональный стиль стрелочка сжато по максимуму

Замечание: node.js может не видеть =>, для запуска надо использовать специальный флаг
Замечание: >>> node --harmony_arrow_functions app.js


Функция reduce
==============

Замечание: как работает функция reduce?

    1) она проходит по всем элементам
    2) она применяет некоторую функцию к ним
    3) результат применения передается как аргумент для следуюшего вызова
    4) в результате из функции выходит одно(!) число

Пример: найти сумму всех покупок, расположенных внутри массива

    # Вариант 1: простое обычное программирование
    const orders = [
        { amount: 100 },
        { amount: 110 },
        { amount: 95 },
        { amount: 115 },
        { amount: 600 },
        { amount: 10 }
    ];
    var totalAmount = 0;
    for (var i = 0; i < orders.length; i++) {
        totalAmount += orders[i].amount;
    }
    console.log(totalAmount);

    # Вариант 2: функция reduce
    const orders = [
        { amount: 100 },
        { amount: 110 },
        { amount: 95 },
        { amount: 115 },
        { amount: 600 },
        { amount: 10 }
    ];
    var totalAmount = orders.reduce(function(sum, order) {
        return sum + order.amount;
    }, 0);
    console.log(totalAmount);

Замечание: можно посмотреть как получается сумма по шагам

    var totalAmount = orders.reduce(function(sum, order) {
        console.log(sum, order);
        return sum + order.amount;
    }, 0);
    console.log(totalAmount);

