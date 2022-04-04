
Функциональное програмирование: функции высшего порядка
=======================================================

Рекурсия
========

1) Рекурсия это ситуация, когда функция внутри себя вызывает сама себя
2) Простой вариант для математика: числа Фибоначчи = 1,1,2,3,5,8,13,21,...
3) Простой вариант для не-математика: вывести на экран числа 10,9,8,...,1

Задача: получить на экране 10,9,8,7,6,5,4,3,2,1.

Шаг 1: просто выведем на экран число 10

    const countDown = (num) => {
        console.log(num);
    }

    countDown(10);

Шаг 2: выведем на экран 10 и вызовем функцию для num - 1

    const countDown = (num) => {
        console.log(num);
        countDown(num - 1);
    }

    countDown(10);

Шаг 3: добавим условие возвращения из функции

    const countDown = (num) => {
        if (num === 0) return;
        console.log(num);
        countDown(num - 1);
    }

    countDown(10);

Пример: у нас есть массив данных, надо собрать его в древовидную структуру

Шаг 1: напишем данные и выведем их через функцию

    const categories = [
      { id: 'животные', 'parent': null },
      { id: 'млекопитающие', 'parent': 'животные' },
      { id: 'кошки', 'parent': 'млекопитающие' },
      { id: 'собаки', 'parent': 'млекопитающие' },
      { id: 'чихуа-хуа', 'parent': 'собаки' },
      { id: 'лабрадор', 'parent': 'собаки' },
      { id: 'персидские', 'parent': 'кошки' },
      { id: 'сиамские', 'parent': 'кошки' }
    ];
    
    console.log(
        makeTree(categories)
    );

Шаг 2: создадим функцию и пусть она возвращает пустой объект

    const categories = [
      { id: 'животные', 'parent': null },
      { id: 'млекопитающие', 'parent': 'животные' },
      { id: 'кошки', 'parent': 'млекопитающие' },
      { id: 'собаки', 'parent': 'млекопитающие' },
      { id: 'чихуа-хуа', 'parent': 'собаки' },
      { id: 'лабрадор', 'parent': 'собаки' },
      { id: 'персидские', 'parent': 'кошки' },
      { id: 'сиамские', 'parent': 'кошки' }
    ];
    
    const makeTree = () => {
        return {};
    };
    
    console.log(
        makeTree(categories)
    );

Шаг 3
  
  1) создадим ноду (узел), куда положим корневую ноду (parent=null) 
  2) для каждой такой ноды (их будет 1) вызовем makeTree с категориями (parent=id)

    const categories = [
      { id: 'животные', 'parent': null },
      { id: 'млекопитающие', 'parent': 'животные' },
      { id: 'кошки', 'parent': 'млекопитающие' },
      { id: 'собаки', 'parent': 'млекопитающие' },
      { id: 'чихуа-хуа', 'parent': 'собаки' },
      { id: 'лабрадор', 'parent': 'собаки' },
      { id: 'персидские', 'parent': 'кошки' },
      { id: 'сиамские', 'parent': 'кошки' }
    ];
    
    const makeTree = (categories, parent) => {
        let node = {};
        categories
            .filter(c => c.parent === parent)
            .forEach(c => node[c.id] = makeTree(categories, c.id))
        return node;
    };
    
    console.log(
        makeTree(categories, null)
    );

Замечание: результат будет не красивый, его надо вывести через JSON

{
  "животные": {
    "млекопитающие": {
      "кошки": {
        "персидские": {},
        "сиамские": {}
      },
      "собаки": {
        "чихуа-хуа": {},
        "лабрадор": {}
      }
    }
  }
}

Комментарии
===========

const makeTree = (categories, parent) => {   // 3) запускаем функию(категории, null)
    let node = {};                           // 4) создаем пустую ноду (node = {})
    categories                               // 5) для категорий вызываем каскад функций
        .filter(c => c.parent === parent)    // 6) фильтруем категории, чтобы найти те, у которых parent == null
        .forEach(c => node[c.id]             // 7) проходим по ним и кладем в node[их id] значение, = 
        = makeTree(categories, c.id))        // 8) вызову функции makeTree(категории, млекопитающие=корень)
    return node;                             // ...9) цикл forEach кончился, фильтр отработал
};

console.log(                                 // 1) выводим на экран результат, который =
    makeTree(categories, null)               // 2) функция makeTree(категории, null=корень)
);                                           // конец программы  