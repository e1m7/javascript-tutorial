
Лекция 14: ничего & не определено
=================================

Вводные понятия
===============

Замечание: в JavaScript есть две сущности

  1) null (ничего)
  2) undefined (не определено)

Null это пустое значение для переменных любого типа

      let name = null;
      console.log(name === null);

Undefined возвращается для переменной, которое не присвоено значение

    let name;
    console.log(name);

Отличия null от undefined
=========================

  1) если переменная = null, то у нее есть значение
  2) если переменная = undefined, то у нее нет значения
  3) при попытке получить доступ к объекту по ключу, которого нет = undefined
  4) если функция не возвращает значение, то оно = undefined
  5) если параметр функции не был передан, то он = undefined

Замечание: проверить факт, что переменная не определена только ===

    let sample;
    console.log(sample === undefined);

Замечание: иногда надо дать значение переменной, если она = null || undefined
Замечание: в 2020 году был введен оператор ?? (оператор объединения)

    let amount = null;        // amount = null (пустое значение)
    amount = amount ?? 1;     // amount = 1 (пустое или 1 => 1)

    amount = 0;               // amount = 0 (ноль, число)
    amount = amount ?? 1;     // amount = 0 (пустое или 1 => 0)


Задача 14 "Amusement Park"
==========================

  Задача: билеты для парка развлечения

    // получить имя, возраст, id посетителя; вернуть объект
    export function createVisitor(name, age, ticketId) {
      return { name, age, ticketId }
    }

    // обнулить id посетителя, сохранив имя и возраст
    export function revokeTicket(visitor) {
      visitor['ticketId'] = null;
      return visitor;
    }

    // обработать новый билет
    export function ticketStatus(tickets, ticketId) {
      if (tickets.hasOwnProperty(ticketId)) {
        let val = tickets[ticketId];
        if (val === null) {
          return 'not sold';
        } else {
          return 'sold to ' + val;
        }
      } else {
        return 'unknown ticket id';
      }
    }

    // обработать новый билет (упрощенная форма)
    export function simpleTicketStatus(tickets, ticketId) {
      if (ticketStatus(tickets, ticketId) == 'not sold' || ticketStatus(tickets, ticketId) == 'unknown ticket id') {
        return 'invalid ticket !!!';
      } else {
        return tickets[ticketId];
      }
    }

    // вернуть номер версии контракта || undefined
    export function gtcVersion(visitor) {
      let ver = visitor.gtc?.version;
      if (ver !== undefined) {
        return ver;
      }
    }
