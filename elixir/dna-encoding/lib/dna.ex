defmodule DNA do
  def encode_nucleotide(code_point) do
    case (code_point) do
      ?\s -> 0b0000
      ?A  -> 0b0001
      ?C  -> 0b0010
      ?G  -> 0b0100
      ?T  -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case (encoded_code) do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna) do
    encode_rec(dna, <<>>)
  end

  defp encode_rec([], acc), do: acc
  defp encode_rec([h | t], acc) do
    encode_rec(t, <<acc::bitstring, encode_nucleotide(h)::4>>)
  end

  def decode(dna) do
    decode_rec(dna, '')
  end

  defp decode_rec(<<>>, acc), do: acc
  defp decode_rec(<<h::4, t::bitstring>>, acc) do
    decode_rec(t, acc ++ [decode_nucleotide(h)])
  end
end
