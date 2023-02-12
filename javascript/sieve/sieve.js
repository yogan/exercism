export const primes = (n) => {
  let numbers = Array.from({ length: n }, (_, i) => i + 1).filter(i => i > 1)

  for (let i = 0; i < numbers.length; i++) {
    const prime = numbers[i]
    for (let multiple = prime * 2; multiple <= n; multiple += prime) {
      numbers = numbers.filter(x => x !== multiple)
    }
  }

  return numbers
};
