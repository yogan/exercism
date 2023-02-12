export const flatten = (array) => {
  const res = []

  array.forEach(elem => {
    if (elem !== null && elem !== undefined) {
      res.push(...(Array.isArray(elem) ? flatten(elem) : [elem]))
    }
  })

  return res
};
