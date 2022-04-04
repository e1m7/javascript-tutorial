
Лекция 30: сеты (множества)
===========================

1) Сеты (множества) это структуры, содержащие уникальные значения
2) Значения могут быть чем угодно (примитивы, сложные типы)
3) К элементам сета нет доступа по индексам (индексов нет)
4) К элементам сете доступ по имени 
5) К сету нельзя добавить элемент, который там уже есть

    # 1) создадим новый сет `set`
    # 2) создадим новый сет `object`
    # 3) создадим новый сет `functionallyIdenticalObject`
    const set = new Set();
    const object = { color: 'lime green' };
    const functionallyIdenticalObject = { color: 'lime green' };

    # 4) добавим в set => object, wow, 77
    set.add(object);
    set.add('wow');
    set.add(77);
    # 5) увидеть их там нельзя, но его размер = 3
    console.log(set.size);

    # 6) добавим в set => functionallyIdenticalObject
    set.add(functionallyIdenticalObject);
    # 7) увидеть их там нельзя, но его размер = 4
    console.log(set.size);

    # 8) добавим в set => 77 (нельзя, там уже есть такой)
    set.add(77);
    # 9) увидеть их там нельзя, но его размер = 4
    console.log(set.size);


Задача 30 "Ozan's Playlist"
===========================

  Задача: плейлист Озана для путешествия (1,5 миллиона треков)

    // 1) удалить дубликаты треков
    export function removeDuplicates(playlist) {
      playlist = [...new Set(playlist)];
      return playlist;
    }

    // 2) есть ли трек в данном списке?
    export function hasTrack(playlist, track) {
      return (new Set(playlist)).has(track);
    }

    // 3) добавить трек в список
    export function addTrack(playlist, track) {
      const newlist = new Set(playlist);
      newlist.add(track);
      return [...newlist];
    }

    // 4) удалить трек из списка
    export function deleteTrack(playlist, track) {
      const newlist = new Set(playlist);
      newlist.delete(track);
      return [...newlist];
    }

    // 5) вернуть список уникальных исполнителей
    export function listArtists(playlist) {
      let artists = [];
      for (let a of playlist) {
        artists.push(a.split('-')[1].trim());
      }
      let my = [...new Set(artists)];
      return my;
    }