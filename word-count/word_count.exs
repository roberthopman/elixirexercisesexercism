defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/[:!&@$%^,]/, "")
    |> String.replace(~r/_/, " ")
    |> String.downcase()

    # v1
    |> String.split()
    |> Enum.group_by(fn x -> x end)
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Enum.into(%{})

    # from https://stackoverflow.com/a/37463717/6430382
    # v2
    # String.split()
    # |> Enum.reduce(%{}, fn word, acc -> Map.update(acc, word, 1, &(&1 + 1)) end)
  end
end
