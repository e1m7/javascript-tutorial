
const fs = require('fs')

const output = fs.readFileSync('data.txt', 'utf8')
  .trim()
  .split('\n')
  .map(line => line.split('\t'))
  .reduce((customer, line) => {
    customer[line[0]] = customer[line[0]] || []
    customer[line[0]].push({
      name: line[1],
      price: line[2],
      ratind: line[3]
    })
    return customer;
  }, {})

console.log(JSON.stringify(output, null, 2));