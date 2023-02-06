defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    add_player(scores, name)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn cur -> cur + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
