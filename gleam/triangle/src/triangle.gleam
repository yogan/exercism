pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && { a == b || b == c || a == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && a != b && b != c && a != c
}

fn valid(a: Float, b: Float, c: Float) -> Bool {
  a >. 0.0 && b >. 0.0 && c >. 0.0 && a +. b >. c && a +. c >. b && b +. c >. a
}
