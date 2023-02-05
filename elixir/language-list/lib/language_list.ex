defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    # NOTE: there is tl/1, but that's boring
    [_ | tail] = list
    tail
  end

  def first(list) do
    # NOTE: there is hd/1, but that's boring
    [head | _] = list
    head
  end

  def count(list) do
    # NOTE: there is length/1, but that's boring
    case list do
      []         -> 0
      [_ | tail] -> 1 + count(tail)
    end
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
