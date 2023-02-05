defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  # TODO: support empty list via pattern matching
  def remove(list) do
    [_head | tail] = list
    tail
  end

  def first(list) do
    [head | _tail] = list
    head
  end

  # TODO: just for fun, build a recursive solution
  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
