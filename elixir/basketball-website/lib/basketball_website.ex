defmodule BasketballWebsite do
  def extract_from_path(data, path), do: String.split(path, ".") |> extract(data)

  defp extract([h],     data), do: data[h]
  defp extract([h | t], data), do: extract(t, data[h])

  def get_in_path(data, path), do: get_in(data, String.split(path, "."))
end
