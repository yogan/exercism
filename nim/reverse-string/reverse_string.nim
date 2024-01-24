proc reverse*(s: string): string =
  var r = ""
  for i in 1..s.len:
    r = r & s[s.len - i]
  return r
