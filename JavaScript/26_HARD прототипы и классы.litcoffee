
Лекция 26: прототипы и классы
=============================

Вводные понятия
===============

1) JavaScript позволяет программировать с стиле ООП
2) ООП: создаются некоторые шаблоны (классы) со свойствами и функциями
3) ООП: из класса создают экземпляры класса (переменные), с ними работает программа
4) В JavaScript: свойства класса == поля, функции класса == методы
5) До 2015 года в JavaScript не было ООП, были прототипы (функции)

====================
Рассмотрим прототипы
====================

1) Класс (до 2015 года) в JavaScript это функция-конструктор
2) Имя функции пишется с заглавной буквы (например, Car)
3) Экземпляры такого класса создаются через `new`

    function Car() {
      // прекрасный код
      // прекрасный код
      // прекрасный код
    }

    const car1 = new Car();
    const car2 = new Car();

4) В JavaScript (и это мило) класс и экземпляр сохраняют связь (папа - сын)
5) Экземпляр имеет тайное свойство `prototype` (ссылка на папу-конструктор)
6) Фактически, экземпляр класа это не функция, а объект (например, car1 = {})
7) Родительская функция (класс) называется "прототип экземпляра"

Как создаются поля
==================

Замечание: внутри конструктора `this` обозначает "мой будущий сын-объект"
Замечание: папа (прототип) может быть с полями, которые перейдут сыну (экземпляру)

    function Car(color, massa) {
      this.color = color;
      this.massa = massa;
      this.engineRunning = false;
    }

    const myCar = new Car('red', 100);
    myCar.color;                          // red
    myCar.engineRunning;                  // false

Как создаются методы
====================

Замечание: с методами все чуть-чуть сложнее
Замечание: чтобы добавить метод отцу надо обратится к его прототипу

    function Car() {
      this.engineRunning = false;
    }

    Car.prototype.startEngine = function () {
      this.engineRunning = true;
    };

    Car.prototype.addGas = function (litre) {
      // пока ничего
    };

    const myCar = new Car();            // создали экземпляр
    myCar.startEngine();                // запустили двигатель
    console.log(myCar.engineRunning);   // true       

Цепочка прототипов
==================

1) Если проверить тип переменной `myCar`, то он = объект
2) Если проверить список свойств `myCar`, то там нет `startEngine()`
3) Почему все работает? Все дело в "цепочке прототипов"

  - когда JavaScript ищет свойства объекта, то он ищет их в объекте
  - если его нет в объекте, то JavaScript ищет его в прототипе объекта
  - myCar >>> Car >>> startEngine()

4) Цепочка не кончается на `Car`, у него есть прототип `Object`
5) У класса Object есть методы, которые доступны всем его подклассам

  - например, toString() (превратить в строку)

    function Car() {
        this.engineRunning = false;
    }

    Car.prototype.startEngine = function () {
        this.engineRunning = true;
    };

    # создадим экземпляр класса
    const myCar = new Car();
    myCar.startEngine();
    console.log(myCar.engineRunning);

    # выведем на экран экземпляр класса
    console.log(myCar);               // Car {engineRunning: true}
    console.log(myCar.toString());    // [object Object]
    
Замечание: для красивого вывода свойство toString можно переопределить

    Car.prototype.toString = function () {
        return `My best car, engine: ${this.engineRunning}`;
    };


=================
Рассмотрим классы
=================

1) Сейчас можно определять класс как `class`
2) Определение стало больше похоже на аналогичное из C/C++
3) Работа с классами сделана по образцу работы с объектами

    class Car {
      constructor(color, massa) {
        this.color = color;
        this.massa = massa;
        this.engineRunning = false;
      }

      startEngine() {
        this.engineRunning = true;
      }

      addGas(litre) {
        // пока ничего
      }
    }

    const myCar = new Car();
    myCar.startEngine();
    myCar.engineRunning;

Замечание: все, что написано выше = "синтаксический сахар"
Замечание: в реальности в JavaScript все на прототипах, папах и детях

Приватные поля, геттеры/сеттеры
===============================

1) По-умолчанию все поля класса общедоступны
2) Их можно менять из программы: читать, записывать
3) Есть соглашение: поля _name считаются закрытыми
4) Для таких полей можно писать get/set функции

    class Car {
      constructor() {
        # пробег = 0
        this._milage = 0;
      }

      # получить пробег машины
      get milage() {
        return this._milage;
      }

      # установить пробег машины
      set milage(value) {
        throw new Error("Запрещенное действие");
      }
    }

    const myCar = new Car();
    myCar.milage;                 // 0
    myCar.milage = 100;           // Ошибка: "Запрещенное действие"


Задача 26 "Windowing System"
============================

  Задача: смоделировать оконную компьютерную систему

    1-2) синтаксис прототипов
    3-6) синтаксис классов


    // 1) создать класс Size и метод resize
    export function Size(width=80, height=60) {
      this.width = width;
      this.height = height;
    }

    Size.prototype.resize = function (newWidth, newHeight) {
      this.width = newWidth;
      this.height = newHeight;
    };

    // 2) создать класс Position
    export function Position(x=0, y=0) {
      this.x = x;
      this.y = y;
    }

    Position.prototype.move = function (newX, newY) {
      this.x = newX;
      this.y = newY;
    };

    // 3) класс ProgramWindow c тремя полями
    export class ProgramWindow {
      constructor(screenSize, size, position) {
        this.screenSize = new Size(800, 600);
        this.size = new Size();
        this.position = new Position();
      };

      // 4) добавить resize()
      resize(newSize) {
        if (newSize.width < 1) newSize.width = 1;
        if (newSize.height < 1) newSize.height = 1;
        if (newSize.width > this.screenSize.width) newSize.width = this.screenSize.width - this.position.x;
        if (newSize.height > this.screenSize.height) newSize.height = this.screenSize.height - this.position.y;
        this.size.height = newSize.height;
        this.size.width = newSize.width;
      };

      // 5) добавить move()
      move(newPos) {
        if (newPos.x < 0) newPos.x = 0;
        if (newPos.y < 0) newPos.y = 0;
        if (newPos.x + this.size.width > this.screenSize.width) newPos.x = this.screenSize.width - this.size.width;
        if (newPos.y + this.size.height > this.screenSize.height) newPos.y = this.screenSize.height - this.size.height;
        this.position.x = newPos.x;
        this.position.y = newPos.y;
      };
    
    };

    // 6) добавить changeWindow
    export function changeWindow(pw) {
      const newSize = new Size(400, 300);
      const newPos = new Position(100, 150)
      pw.resize(newSize);
      pw.move(newPos);
      return pw;
    };