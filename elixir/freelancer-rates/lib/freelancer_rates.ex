defmodule FreelancerRates do
  @hours_per_day 8.0
  @days_per_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  defp to_monthly(daily), do: daily * @days_per_month

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
      |> daily_rate
      |> to_monthly
      |> apply_discount(discount)
      |> ceil
  end

  defp to_days(per_day, budget), do: Float.floor(budget / per_day, 1)

  def days_in_budget(budget, hourly_rate, discount) do
    hourly_rate
      |> daily_rate
      |> apply_discount(discount)
      |> to_days(budget)
  end
end
