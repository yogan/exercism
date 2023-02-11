defmodule NameBadge do
  def print(id, name, department) do
    id = if id != nil, do: "[#{id}] - ", else: ""
    dep = if department != nil, do: String.upcase(department), else: "OWNER"
    "#{id}#{name} - #{dep}"
  end
end
