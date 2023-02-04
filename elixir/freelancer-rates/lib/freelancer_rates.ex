defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    price = daily_rate(hourly_rate) * 22
    apply_discount(price, discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    per_day = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / per_day, 1)
  end
end
