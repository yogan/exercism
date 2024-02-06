defmodule RomanNumerals do
  @doc """
  Convert the n to a roman n.
  """
  @spec numeral(pos_integer) :: String.t()

  # ---- Invalid ----

  def numeral(n) when n < 0 or n >= 4000 do
    raise ArgumentError, message: "#{n} is out of range"
  end

  # ---- 1000s ----

  def numeral(n) when n >= 1000 do
    thousands = div(n, 1000)
    String.duplicate("M", thousands) <> numeral(n - thousands * 1000)
  end

  # ---- 100s ----

  def numeral(n) when n >= 900, do: "CM" <> numeral(n - 900)

  def numeral(n) when n >= 500 do
    hundreds = div(n, 100)
    cs = hundreds - 5
    "D" <> String.duplicate("C", cs) <> numeral(n - hundreds * 100)
  end

  def numeral(n) when n >= 400, do: "CD" <> numeral(n - 400)

  def numeral(n) when n >= 100 do
    hundreds = div(n, 100)
    String.duplicate("C", hundreds) <> numeral(n - hundreds * 100)
  end

  # ---- 10s ----

  def numeral(n) when n >= 90, do: "XC" <> numeral(n - 90)

  def numeral(n) when n >= 50 do
    tens = div(n, 10)
    xs = tens - 5
    "L" <> String.duplicate("X", xs) <> numeral(n - tens * 10)
  end

  def numeral(n) when n >= 40, do: "XL" <> numeral(n - 40)

  def numeral(n) when n >= 10 do
    tens = div(n, 10)
    String.duplicate("X", tens) <> numeral(n - tens * 10)
  end

  # ---- 1s ----

  def numeral(n) when n == 9, do: "IX"
  def numeral(n) when n >= 5, do: "V" <> String.duplicate("I", n - 5)
  def numeral(n) when n == 4, do: "IV"
  def numeral(n) when n >= 1, do: String.duplicate("I", n)
  def numeral(n) when n == 0, do: ""

end
