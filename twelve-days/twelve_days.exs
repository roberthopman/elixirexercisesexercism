defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """

  @gifts """
  a Partridge in a Pear Tree.
  two Turtle Doves, and
  three French Hens,
  four Calling Birds,
  five Gold Rings,
  six Geese-a-Laying,
  seven Swans-a-Swimming,
  eight Maids-a-Milking,
  nine Ladies Dancing,
  ten Lords-a-Leaping,
  eleven Pipers Piping,
  twelve Drummers Drumming,
  """ |> String.split("\n", trim: true)

  @days ~w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    intro =
      @days
      |> magic(number)

    all_gifts =
      @gifts
      |> magic(number)
      |> Enum.reverse()

    Enum.join(intro ++ all_gifts, "")
  end

  def magic(list, number) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {x, i} ->
      cond do
        i == 0 and x in @gifts            -> x
        i <= (number - 1) and x in @gifts -> x <> " "
        i == (number - 1) and x in @days  -> "On the #{x} day of Christmas my true love gave to me, "
        true -> nil
      end
    end)
    |> Enum.filter(fn x -> x != nil end)
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.to_list()
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
    |> String.trim()
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing() do
    verses(1, 12)
  end
end
