defmodule Username do
  def sanitize(''), do: ''

  def sanitize([charcode | rest]) do
    sanitized = case charcode do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      ?_ -> '_'
      c when ?a <= c and c <= ?z -> [charcode]
      _  -> ''
    end

    sanitized ++ sanitize(rest)
  end
end
