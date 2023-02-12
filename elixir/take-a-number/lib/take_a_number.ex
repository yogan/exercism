defmodule TakeANumber do
  def start() do
    spawn(fn -> loop(0) end)
  end

  defp loop(num) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, num) |> loop

      {:take_a_number, sender_pid} ->
        send(sender_pid, num + 1) |> loop

      :stop -> :ok

      _ -> loop(num)
    end
  end
end
