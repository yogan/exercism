export function count(linesStr) {
  const lines = linesStr.map((line) => line.split(''))
  let rectangles = 0

  for (let i = 0; i < lines.length; i++) {
    const indices = []

    for (let j = 0; j < lines[i].length; j++) {
      if (lines[i][j] === '+') {
        indices.push(j)
      }
    }

    if (indices.length < 2) {
      continue
    }

    for (let li = 0; li < indices.length - 1; li++) {
      for (let ri = li + 1; ri < indices.length; ri++) {
        const l = indices[li]
        const r = indices[ri]
        for (let m = i + 1; m < lines.length; m++) {
          if (r < lines[m].length && lines[m][l] === '+' && lines[m][r] === '+') {
            // only count if connected (+ or - horizontally, | or + vertically)
            const top = lines[i].slice(l, r - 1)
            const btm = lines[m].slice(l, r - 1)
            const left = lines.slice(i, m).map((line) => line[l])
            const right = lines.slice(i, m).map((line) => line[r])
            const horizontal = top.concat(btm)
            const vertical = left.concat(right)
            if (horizontal.every((c) => c === '-' || c === '+') &&
              vertical.every((c) => c === '|' || c === '+')) {
              rectangles++
            }
          }
        }
      }
    }
  }

  return rectangles
}
