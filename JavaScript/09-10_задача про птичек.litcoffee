
Задача 9-10 "Bird Watcher"
==========================

  Задача: про птичек

    // подсчитать сумму элементов массива
    export function totalBirdCount(birdsPerDay) {
      return birdsPerDay.reduce(function(a, b) {
        return a + b;
      }, 0);
    }

    // подсчитать число птиц на определенную неделю
    export function birdsInWeek(birdsPerDay, week) {
      let start = 0;
      if (week > 1) { start = 7*(week-1); }
      let finish = start + 6;
      let s = 0;
      for (let i = start; i <= finish; i++) { s += birdsPerDay[i]; }
      return s;
    }

    // подсчитать число птиц, учитывая ту, которая пряталась
    export function fixBirdCountLog(birdsPerDay) {
      for (let i = 0; i < birdsPerDay.length; i = i + 2) {
        birdsPerDay[i] = birdsPerDay[i] + 1;
      }
      return birdsPerDay;
    }
