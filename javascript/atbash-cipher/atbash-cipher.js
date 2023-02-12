const createTable = () => {
  const startCode = 'a'.charCodeAt(0)
  const endCode   = 'z'.charCodeAt(0)

  let tbl = new Map()

  for (let i = 0; i <= endCode - startCode; i++) {
    const clear     = String.fromCharCode(startCode + i)
    const encrypted = String.fromCharCode(endCode   - i)
    tbl.set(clear, encrypted)
  }

  for (let n = 0; n < 10; n++) {
    tbl.set(String(n), String(n))
  }

  return tbl
}

const table = createTable()

export const encode = (input) =>
  input.split("")
    .map(letter => letter.toLowerCase())
    .filter(letter => table.has(letter))
    .map(letter => table.get(letter))
    .reduce((acc, cur, i) => acc + ((i>0 && i%5 === 0) ? ' ' : '' ) + cur, "")

export const decode = (input) =>
  input.split("")
    .filter(letter => table.has(letter))
    .map(letter => table.get(letter))
    .join("")
