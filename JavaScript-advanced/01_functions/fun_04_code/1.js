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
  JSON.stringify(makeTree(categories, null), null, 2)
);