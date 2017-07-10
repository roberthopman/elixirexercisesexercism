defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, _size) do
    if _size > 0 do
      _s
      |> String.split("", trim: true)
      |> Enum.with_index()
      |> Enum.map(fn {x, i} ->
        if (i + _size > String.length(_s)) do
          nil
        else
          String.slice(_s, i, _size)
        end
      end)
      |> Enum.filter(fn x -> x != nil end)
    else
      []
    end
  end
end
