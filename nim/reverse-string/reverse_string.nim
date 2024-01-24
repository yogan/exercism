proc reverse*(s: string): string =
  for i in 1..s.len:
    result.add(s[s.len - i])
