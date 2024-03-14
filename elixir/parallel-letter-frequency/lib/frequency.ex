defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Enum.chunk_every(workers)
    |> Enum.map(fn chunk ->
      chunk
      |> Enum.map(&Task.async(fn -> calc_freq(&1) end))
      |> Enum.map(&Task.await/1)
    end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn freq, acc ->
      Map.merge(acc, freq, fn _char, count1, count2 ->
        count1 + count2
      end)
    end)
  end

  defp calc_freq(text) do
    text
    |> String.downcase()
    |> String.graphemes()
    |> Enum.filter(&letter?/1)
    |> Enum.frequencies()
  end

  defp letter?(string) do
    Regex.match?(~r/^\p{L}$/fu, string)
  end
end
