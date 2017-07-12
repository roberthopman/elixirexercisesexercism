defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    cond do
      String.length(word) == 0 -> 0
      String.first(word) == " " -> 0
      true -> word
                |> String.downcase()
                |> String.replace(~r/[aeioulnrst]/, "1,")
                |> String.replace(~r/[dg]/, "2,")
                |> String.replace(~r/[bcmp]/, "3,")
                |> String.replace(~r/[fhvwy]/, "4,")
                |> String.replace(~r/[k]/, "5,")
                |> String.replace(~r/[jx]/, "8,")
                |> String.replace(~r/[qz]/, "10,")
                |> String.split(",", trim: true)
                |> Enum.map(fn x -> String.to_integer(x) end)
                |> Enum.reduce(fn(x, acc) -> x + acc end)
    end
  end
end

# feedback on style == appreciated
