defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace("-", " ")
    |> String.replace("T", " T")
    |> String.split(" ")
    |> Enum.map(fn(word) -> String.first(word) end)
    |> Enum.join("")
    |> String.upcase()
  end
end

# 1 pick most difficult test
# 2 split, map, join, replace, upcase, then fix the replace "T"
