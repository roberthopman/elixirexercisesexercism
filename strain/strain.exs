defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun), do: keep(list, fun, [])
  defp keep([], _, acc), do: Enum.reverse(acc)
  defp keep([head | tail], fun, acc) do
    if fun.(head) do
      keep(tail, fun, [head | acc])
    else
      keep(tail, fun, acc)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, fn(x) -> !fun.(x) end)
  end
end

  # step 1 realise it is recursion
  # https://elixir-lang.org/getting-started/recursion.html
  # functional languages require recursion to iterate over a list until a condition is met
  # step 2
  # substitue list with [head|tail]
  # step 3 use the head (first item in the list) for the function
  # if true
  # add head to list and as tail execute the function
  # if false
  # execute the function
  # step 4
  # feedback required:
  # if keep gets (empty ??) list and any function return the (empty??) list
  # step 5
  # for discard substitute true for false
  # step 6
  # implement mutual recursion, (discard becomes inverse of keep)
  # step 7
  # implement tail recursion optimization
  # add an accumulator to the definition

  # example by NobbZ
  # normal recursion
  # def length_rec([]), do: []
  # def length_rec([_|tail]), do: 1 + length_rec(tail)

  # tail optimized recursion
  # def length_tail_rec(list), do: length_tail_rec(list, 0)
  # defp length_tail_rec([], acc), do: acc
  # defp length_tail_rec([_|tail], acc), do: length_tail_rec(tail, acc + 1)
