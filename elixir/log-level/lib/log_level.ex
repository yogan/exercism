defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      [level, legacy?] == [0, true]  -> :unknown
      [level, legacy?] == [0, false] -> :trace

      [level, legacy?] == [5, true]  -> :unknown
      [level, legacy?] == [5, false] -> :fatal

      level == 1                     -> :debug
      level == 2                     -> :info
      level == 3                     -> :warning
      level == 4                     -> :error

      true                           -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :error or label == :fatal    -> :ops

      [label, legacy?] == [:unknown, true]  -> :dev1
      [label, legacy?] == [:unknown, false] -> :dev2

      true                                  -> false
    end
  end
end
