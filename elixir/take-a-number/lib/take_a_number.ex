defmodule TakeANumber do
  def start() do
    spawn(__MODULE__, :loop, [0])
  end

  def loop(num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, num)
        loop(num)

      {:take_a_number, sender_pid} ->
        num = num + 1
        send(sender_pid, num)
        loop(num)

      :stop -> nil

      _ -> loop(num)
    end
  end
end
