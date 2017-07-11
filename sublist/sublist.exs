defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?(a, y) when length(a) <= length(y) do
    cond do
      a === Enum.take(y, length(a)) -> true
      true -> sublist?(a, tl(y))
    end
  end
  defp sublist?(_, _), do: false
end

# start comparing with cond do
# equal is easy: a===b
# then start pattern matching
# for sublist, match a with take(y, length(a))
# otherwise do recursively (a, tl(y))
# if nothing matches, give false
# same for superlist but (a,b) is (b,a)
# add guard clause to guard for edge cases
#
# from: https://github.com/baschtl/elixir.challenges/blob/master/sublist/sublist.exs
