defmodule Username do
  defguard is_lowercase_letter(charcode) when ?a <= charcode and charcode <= ?z
  defguard is_underscore(charcode) when charcode == ?_
  defguard is_umlaut(charcode) when charcode in [?ä, ?ö, ?ü, ?ß]

  defp keep?(charcode) when is_lowercase_letter(charcode), do: true
  defp keep?(charcode) when is_underscore(charcode), do: true
  defp keep?(charcode) when is_umlaut(charcode), do: true
  defp keep?(_charcode), do: false

  defp expand_umlaut(charcode) do
    case charcode do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> [charcode]
    end
  end

  def sanitize([]), do: []
  def sanitize([h | t]) do
    case keep?(h) do
      true -> expand_umlaut(h) ++ sanitize(t)
      false -> sanitize(t)
    end
  end
end
