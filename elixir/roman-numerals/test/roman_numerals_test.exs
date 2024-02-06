defmodule RomanNumeralsTest do
  use ExUnit.Case

  test "1" do
    assert RomanNumerals.numeral(1) == "I"
  end

  test "2" do
    assert RomanNumerals.numeral(2) == "II"
  end

  test "3" do
    assert RomanNumerals.numeral(3) == "III"
  end

  test "4" do
    assert RomanNumerals.numeral(4) == "IV"
  end

  test "5" do
    assert RomanNumerals.numeral(5) == "V"
  end

  test "6" do
    assert RomanNumerals.numeral(6) == "VI"
  end

  test "9" do
    assert RomanNumerals.numeral(9) == "IX"
  end

  test "27" do
    assert RomanNumerals.numeral(27) == "XXVII"
  end

  test "48" do
    assert RomanNumerals.numeral(48) == "XLVIII"
  end

  test "59" do
    assert RomanNumerals.numeral(59) == "LIX"
  end

  test "93" do
    assert RomanNumerals.numeral(93) == "XCIII"
  end

  test "141" do
    assert RomanNumerals.numeral(141) == "CXLI"
  end

  test "163" do
    assert RomanNumerals.numeral(163) == "CLXIII"
  end

  test "402" do
    assert RomanNumerals.numeral(402) == "CDII"
  end

  test "575" do
    assert RomanNumerals.numeral(575) == "DLXXV"
  end

  test "911" do
    assert RomanNumerals.numeral(911) == "CMXI"
  end

  test "1024" do
    assert RomanNumerals.numeral(1024) == "MXXIV"
  end

  test "3000" do
    assert RomanNumerals.numeral(3000) == "MMM"
  end

  test "16" do
    assert RomanNumerals.numeral(16) == "XVI"
  end

  test "66" do
    assert RomanNumerals.numeral(66) == "LXVI"
  end

  test "166" do
    assert RomanNumerals.numeral(166) == "CLXVI"
  end

  test "666" do
    assert RomanNumerals.numeral(666) == "DCLXVI"
  end

  test "500" do
    assert RomanNumerals.numeral(500) == "D"
  end

  test "600" do
    assert RomanNumerals.numeral(600) == "DC"
  end

  test "700" do
    assert RomanNumerals.numeral(700) == "DCC"
  end

  test "800" do
    assert RomanNumerals.numeral(800) == "DCCC"
  end

  test "900" do
    assert RomanNumerals.numeral(900) == "CM"
  end

  test "1000" do
    assert RomanNumerals.numeral(1000) == "M"
  end

  test "1001" do
    assert RomanNumerals.numeral(1001) == "MI"
  end

  test "1666" do
    assert RomanNumerals.numeral(1666) == "MDCLXVI"
  end

  test "3001" do
    assert RomanNumerals.numeral(3001) == "MMMI"
  end

  test "3999" do
    assert RomanNumerals.numeral(3999) == "MMMCMXCIX"
  end

  test "-1 throws" do
    assert_raise ArgumentError, "-1 is out of range",
      fn -> RomanNumerals.numeral(-1) end
  end

  test "4000 throws" do
    assert_raise ArgumentError, "4000 is out of range",
      fn -> RomanNumerals.numeral(4000) end
  end
end
