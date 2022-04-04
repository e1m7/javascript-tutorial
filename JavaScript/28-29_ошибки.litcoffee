
Лекция 28-29: ошибки, наследование
==================================

Ошибки
======

1) Ошибки это сообщения о не верно работающем коде
2) Ошибки это объекты JavaScript, основное свойство = message
3) Ошибку можно вызвать (возбудить) через `throw`

    const error = new Error('Что-то плохое произошло!');
    console.log(error.message);

    throw new Error('Ошибка!');

4) Обычно место, в котором может произойти ошибка, окружают `try...catch`

    try {
      throw new Error('Упс');
    } catch (error) {
      console.log(error.message);
    }

5) Ошибки это классы, можно создавать свои ошибки, населедованные от Error
6) Наследование происходит через слово `extends` (расширение)
7) Кастомные ошибки можно проверять на принадлежность к под-классу

    class CustomError extends Error {}

    try {
      // прекрасный код, все работает
      // прекрасный код, все работает
      // прекрасный код, все работает
      // возникла ошибка(!)
      // прекрасный код, все работает
      // прекрасный код, все работает
      // прекрасный код, все работает
    } catch (error) {
      if (error instanceof CustomError) {
        console.log('Возникла наша ошибка, называется CustomError');
      }
    }


Наследование
============

1) Наследование это создание отношения родитель-потомок между классами
2) Object >>> Father >>> Son (сын имеет доступ к свойствам и методам отца)
3) Father = супер-класс, Son = дочерний класс

  # 1) определяем класс Pet (питомец)
  # 2) питомец получает name (имя)
  # 3) питомец имеет метод introduce (представить)
  class Pet {
    constructor(name) {
      this.name = name;
    }

    introduce() {
      console.log(`Это мой питомец по имени ${this.name}.`);
    }
  }

  # 4) определяем класс Dog (собака) как дочерний для питомца
  # 5) у класса Dog есть name
  # 6) у класса Dog есть introduce
  class Dog extends Pet {}

  const dog = new Dog('Otis');
  dog.introduce();

Замечание: extends это установление связи через прототипы
Замечание: собака будет иметь доступ к свойствам питомца (и Object)

    # создали собаку как экземпляр класса Собака
    const dog = new Dog('Шарик');

    # входил ли объект в цепочку прототипов?
    Dog.prototype.isPrototypeOf(dog);               // => true
    Pet.prototype.isPrototypeOf(dog);               // => true
    Pet.prototype.isPrototypeOf(Dog.prototype);     // => true

    # содержит ли объект свойство?
    Pet.prototype.hasOwnProperty('introduce');      // => true
    Dog.prototype.hasOwnProperty('introduce');      // => false нет
    dog.hasOwnProperty('introduce');                // => false нет


Задача 28-29 "Factory Sensors"

  Задача: новый менеджер газетной фабрики и ее улучшения

    export class ArgumentError extends Error {}

    export class OverheatingError extends Error {
      constructor(temperature) {
        super(`The temperature is ${temperature} ! Overheating !`);
        this.temperature = temperature;
      }
    }

    // 1) вернуть ошибку, если влажность > 70%
    export function checkHumidityLevel(humidityPercentage) {
      if (humidityPercentage > 70) {
        throw new Error('Слишком влажно!');
      }
    }

    // 2) контроль за температурой: 2 типа ошибок
    export function reportOverheating(temperature) {
      if (temperature == null) throw new ArgumentError();
      if (temperature > 500) throw new OverheatingError(temperature);
    }

    // 3) функция, которая реагирует на ошибки 1-2
    export function monitorTheMachine(actions) {
      /* 
        1) если датчик сломан = предупредить техника
        2) если температура > 500 и < 600, то включить лампочку
        3) если температура > 600, то выключить машину
        4) если что-то другое, то перебросить
          action = { 
            check = функция, проверяет температуру машины
            alertDeadSensor = функция, проверяет датчик температуры
            alertOverheating = функция, включает сигнальную лампочку
            shutdown = функция, выключает машину
          }
      */
      try {
        actions.check();
      } catch (error) {
        if (error.constructor == ArgumentError) {
          actions.alertDeadSensor();
          return;
        }
        if (error.constructor == OverheatingError) {
          if (error.temperature > 600) {
            actions.shutdown();
            return;
          };
          if (error.temperature > 500) {
            actions.alertOverheating();
            return;
          };
        };
        throw error;
      }
    }