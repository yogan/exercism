defmodule KitchenCalculator do
  @ml_to_cup         240
  @ml_to_fluid_ounce  30
  @ml_to_teaspoon      5
  @ml_to_tablespoon   15

  def get_volume({_, volume}), do: volume

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end
  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * @ml_to_cup}
  end
  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * @ml_to_fluid_ounce}
  end
  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * @ml_to_teaspoon}
  end
  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * @ml_to_tablespoon}
  end

  def from_milliliter({:milliliter, volume}, unit = :milliliter) do
    {unit, volume}
  end
  def from_milliliter({:milliliter, volume}, unit = :cup) do
    {unit, volume / @ml_to_cup}
  end
  def from_milliliter({:milliliter, volume}, unit = :fluid_ounce) do
    {unit, volume / @ml_to_fluid_ounce}
  end
  def from_milliliter({:milliliter, volume}, unit = :teaspoon) do
    {unit, volume / @ml_to_teaspoon}
  end
  def from_milliliter({:milliliter, volume}, unit = :tablespoon) do
    {unit, volume / @ml_to_tablespoon}
  end

  def convert(volume_pair, unit) do
    volume_pair
      |> to_milliliter()
      |> from_milliliter(unit)
  end
end
