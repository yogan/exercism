import bitops

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  score.uint.testBit(ord(allergen))

proc allergies*(score: int): set[Allergen] =
  for a in Allergen:
    if isAllergicTo(score, a):
      result = result + {a}
