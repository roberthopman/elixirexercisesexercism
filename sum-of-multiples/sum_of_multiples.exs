defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, numbers) do
    numbers
    |> Enum.map(fn(x) ->
         Enum.filter(1..limit-1, fn(y) -> rem(y, x) == 0 end)
       end)
    |> Enum.flat_map(&(&1))
    |> Enum.uniq()
    |> Enum.sum()
  end
end

