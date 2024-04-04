export function valid(digits: string): boolean {
  const noSpaceDigits = digits.replaceAll(" ", "");
  return noSpaceDigits !== "0" && luhnValidate(noSpaceDigits);
}

function luhnValidate(digits: string): boolean {
  function double(d: number): number {
    const e = d * 2;
    return e > 9 ? e - 9 : e;
  }

  const sum = [...digits]
    .map((d) => parseInt(d, 10))
    .reverse()
    .map((d, i) => (i % 2 === 0 ? d : double(d)))
    .reduce((acc, cur) => acc + cur, 0);

  return sum % 10 === 0;
}
