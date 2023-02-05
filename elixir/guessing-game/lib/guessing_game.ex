defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)

  def compare(_secret_number, :no_guess) do
    "Make a guess"
  end

  def compare(secret_number, secret_number) do
    "Correct"
  end

  def compare(secret_number, guess) when abs(secret_number - guess) <= 1 do
    "So close"
  end

  def compare(secret_number, guess) when secret_number < guess do
    "Too high"
  end

  def compare(secret_number, guess) when secret_number > guess do
    "Too low"
  end
end
