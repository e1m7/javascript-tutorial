
Лекция 31: примисы
==================

1) Promise это объект = завершению || сбою асинхронной операции
2) Promice имеет три метода, которые вызываются друг за другом

  - then
  - catch
  - finally

    # 1) создаем промис (новый экземпляр класса)
    # 2) внутри для создания передаем безымянную функцию
    # 3) функция получает два параметра: 1) resolve, 2) reject
    # 4) resolve = это функция
    # 5) reject = это ошибка
    # 6) внутри промиса происходит следующее
    # - определяем массив sampleData (4 элемента)
    # - определяем число randomNumber (1-5)
    # - если в массиве есть элемент с индексом = randomNumber, то...
    # - выполнняем дня него функцию resolve
    # - если нет, то выбрасываем ошибку

    const myPromise = new Promise(function (resolve, reject) {
      let sampleData = [2, 4, 6, 8];
      let randomNumber = Math.floor(Math.random() * (sampleData.length + 1));
      if (sampleData[randomNumber]) {
        resolve(sampleData[randomNumber]);
      } else {
        reject('Произошла ошибка');
      }
    });

    # вызываем промис для работы
    myPromise
      .then(function (e) {
        console.log(e);
      })
      .catch(function (error) {
        throw new Error(error);
      })
      .finally(function () {
        console.log('Обещание выполнено!');
      });  

Метод .then
===========

Замечание: принимает до двух аргументов

  1) функция обратного вызова для разрешенного промиса
  2) функция обратного вызова для отклоненного промиса

Замечание: каждый then генерит новый промис

    const promise1 = new Promise(function (resolve, reject) {
      resolve('Успех!');
    });

    promise1.then(function (value) {
      console.log(value);
    });

Метод catch
===========

Замечание: обрабатывает отклоненные промисы

    const promise1 = new Promise((resolve, reject) => {
      throw '100% ошибка!';
    });

    promise1.catch(function (error) {
      console.error(error);
    });

Метод finally
=============

Замечание: выполняется вне зависимости от успеха || неудачи

    function findDataById(id) {
      return new Promise(function (resolve, reject) {
        let sampleData = [1, 2, 3, 4, 5];
        if (sampleData[id]) {
          resolve(sampleData[id]);
        } else {
          reject(new Error('Неверный индекс'));
        }
      });
    }

    findDataById(14)
      .then(function (response) {
        console.log(response);
      })
      .catch(function (err) {
        console.error(err);
      })
      .finally(function () {
        console.log('Промис выполнен');
      });

Пример: проверка того, что присланное число < 10.

    function findDataById(id) {
      return new Promise(function (resolve, reject) {
        if (10 - id > 0) {
            resolve("OK");
        } else {
          reject(new Error('Вы прислали число > 10'));
        }
      });
    }

    console.log("Первая строка");
    findDataById(5)
      .then(function (response) {
        console.log(response);
      })
      .catch(function (err) {
        console.error(err);
      })
      .finally(function () {
        console.log('Промис выполнен');
      });
    console.log("Вторая строка");


Задача 31 "Translation Service"
===============================

  Задача: API переводчиков, которые дают некоторые гарантии

    export class TranslationService {
      constructor(api) {
        this.api = api;
      }

      // 1) запросить перевод, игнорируя ошибки
      free(text) {
        return this.api.fetch(text)
          .then( (res) => res.translation );
      }

      // 2) запросить перевод набора текстов
      batch(texts) {
        if (texts.length === 0) {
          return Promise.reject(new BatchIsEmpty())
        }
        return Promise.all(texts.map( this.free.bind(this) ));
      }

      // 3) запросить перевод с автоматическим повтором 3 раза
      request(text) {
        const ppp = () => new Promise((resolve, reject) => {
          this.api.request(text, (res) => {
            res ? reject(res) : resolve()
          });
        });
        return ppp()
          .catch(ppp)
          .catch(ppp)
      };

      // 4) запросить премиум-перевод, вернуть если он > числа
      premium(text, minimumQuality) {
        return this.api.fetch(text)
          .catch(() => {
            return this.request(text).then(() => this.api.fetch(text))
          })
          .then( (res) => {
            if (res.quality < minimumQuality) {
              throw new QualityThresholdNotMet()
            }
            return res.translation
          })
      }
    }

