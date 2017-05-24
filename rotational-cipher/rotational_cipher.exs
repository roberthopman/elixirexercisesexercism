defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  # failed solution
  # @letters %{
  #   0 => "a",
  #   1 => "b",
  #   2 => "c",
  #   3 => "d",
  #   4 => "e",
  #   5 => "f",
  #   6 => "g",
  #   7 => "h",
  #   8 => "i",
  #   9 => "j",
  #   10 => "k",
  #   11 => "l",
  #   12 => "m",
  #   13 => "n",
  #   14 => "o",
  #   15 => "p",
  #   16 => "q",
  #   17 => "r",
  #   18 => "s",
  #   19 => "t",
  #   20 => "u",
  #   21 => "v",
  #   22 => "w",
  #   23 => "x",
  #   24 => "y",
  #   25 => "z"
  # }
  # explaining the solution
  # test 1
  # first make the map of all the letters
  # then map over the letters
  # each letter has a key and a lettervalue
  # if the input text equals the letter then
  # return the letter (chosen with key + shift)
  # pipe it into filter for nil
  # pick the head from the list
  #
  # test 2
  # add remainder
  # @letters[key + (rem shift, 26)]
  #
  # test 3 - 4
  # test 5
  # @letters[rem(key + shift, 26)]

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    # failed solution
    # Enum.map(@letters,
    #   fn({key, letter})->
    #     if text == letter do
    #         @letters[rem(key + shift, 26)]
    #     end
    #   end)
    # |> Enum.filter(fn(x) -> x != nil end)
    # |> hd()


    # Solution of Ben Emson with some tweaking
    text
    # convert text to char_list
    # so it becomes an acii value
    |> to_charlist
    # iterate over list apply shift mapping
    # first value is ascii value
    |> Enum.map(&shift_char(&1, shift))
    # return list as binary string
    |> List.to_string
  end

  def shift_char(char, shift) do
    case char do
      # ?a..?z returns ascii value of that character
      chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
      # ?A..?Z returns ascii uppercase value of that character
      chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)

      # if not in the range, return character
      chr -> chr
    end
  end

  def calculate_mapping(base_letter, char, shift) do
    # find the ascii integer of the char and normalize it
    # by substracting the size of the alphabet
    normalize = &(&1 - 26)
    # ensure shift number is within the alphabet size
    shift_num = rem(shift, 26)
    # calculate the shifted value with a shift to the right (+ shift_num)
    # base_letter + rem(char - (base_letter - 26) + rem(shift, 26), 26)
    base_letter + rem(char - normalize.(base_letter) + shift_num, 26)
  end
end

