defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  def remaining_minutes_in_oven(min) do
    expected_minutes_in_oven() - min
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, oven_time) do
    preparation_time_in_minutes(layers) + oven_time
  end

  def alarm(), do: "Ding!"
end
