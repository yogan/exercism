export class House {
  static parts = [
    ['house', 'Jack built.'],
    ['malt', 'lay in'],
    ['rat', 'ate'],
    ['cat', 'killed'],
    ['dog', 'worried'],
    ['cow with the crumpled horn', 'tossed'],
    ['maiden all forlorn', 'milked'],
    ['man all tattered and torn', 'kissed'],
    ['priest all shaven and shorn', 'married'],
    ['rooster that crowed in the morn', 'woke'],
    ['farmer sowing his corn', 'kept'],
    ['horse and the hound and the horn', 'belonged to'],
  ];

  static firstLine(v) {
    return `This is the ${House.parts[v - 1][0]}`
      + `${v === 1 ? ` that ${House.parts[0][1]}` : ''}`;
  }

  static line(v) {
    const prev = House.verse(v - 1);
    prev[0] = prev[0].replace('This is', `that ${House.parts[v - 1][1]}`);
    return [House.firstLine(v), ...prev];
  }

  static verse(v) {
    return v === 1
      ? [House.firstLine(v)]
      : House.line(v)
  }

  static verses(start, end) {
    const lines = []
    for (let i = start; i <= end; i++) {
      lines.push(...House.verse(i));
      if (i !== end) { lines.push("") }
    }
    return lines;
  }
}
