defmodule FreelancerRates do
  @hours_per_day 8.0
  @days_per_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    price = daily_rate(hourly_rate) * @days_per_month
    apply_discount(price, discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    per_day = apply_discount(daily_rate(hourly_rate), discount)
    Float.floor(budget / per_day, 1)
  end
end
