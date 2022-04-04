
Задача 11-12 "Mixed Juices"
===========================

  Задача: про соки и работу барменов

    // по имени сока вернуть число минут его приготовления
    export function timeToMixJuice(name) {
      switch (name) {
        case 'Pure Strawberry Joy':
          return 0.5;
        case 'Energizer':
          return 1.5;
        case 'Green Garden':
          return 1.5;
        case 'Tropical Island':
          return 3;
        case 'All or Nothing':
          return 5;
        default:
          return 2.5;
      }
    }

    // вернуть число лимонов, которые надо разрезать (6-8-10), чтобы набрать нужное
    export function limesToCut(wedgesNeeded, limes) {
      let lims = 0;
      let answer = 0;
      let i = 0;
      while (i < limes.length) {
        if (lims >= wedgesNeeded) {
          return answer;
        }
        if (limes[i] == 'small') {
          answer += 1;
          lims += 6;
        }
        if (limes[i] == 'medium') {
          answer += 1;
          lims += 8;
        }
        if (limes[i] == 'large') {
          answer += 1;
          lims += 10;
        }
        i += 1;
      }
      return answer;
    }

    // вернуть массив заказов, которые перейдут Дмитрию
    export function remainingOrders(timeLeft, orders) {
      const drinks = {
        'Pure Strawberry Joy': 0.5,
        'Energizer': 1.5,
        'Green Garden': 1.5,
        'Tropical Island': 3,
        'All or Nothing': 5
      }
      let i = 0;
      while (timeLeft > 0) {
        timeLeft -= timeToMixJuice(orders[i]);
        i += 1;
      }
      let answer = [];
      while (i < orders.length) {
        answer.push(orders[i]);
        i += 1
      }
      return answer;
    }
