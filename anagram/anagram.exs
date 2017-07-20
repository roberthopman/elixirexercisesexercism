defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.reduce(candidates, [], fn(candidate, acc) ->
      pangram = String.to_char_list(String.downcase(base)) -- to_char_list(String.downcase(candidate))
      check_source = String.to_char_list(base) != to_char_list(String.downcase(candidate))
      check_length = Kernel.length(to_char_list(base)) == Kernel.length(to_char_list(String.downcase(candidate)))
      cond do
        check_length && check_source && pangram == [] -> to_char_list(candidate) ++ acc
        true -> acc
      end
    end)
    |> Enum.chunk(String.length(base))
    |> Enum.reverse()
    |> Enum.map(fn x -> to_string(x) end)
  end
end

#1
# from candidates
# return anagram(s)
# not equal to base
# ex. listen -> inlets
# possible solution
# look at tests
# discover most difficult test
# discover easier tests
# discover edge cases
# solve for most difficult test
# break down the steps to solve it
# apply to other difficutl tests
# solve for easier tests
# solve for edge cases

#2
# defined test "multiple anagrams" do as most difficult test
# anagram could be similar to pangram
# see if base -- candidates letters == empty
# candidates goes from list to []
# that goes into the pangram (try reduce, or filter if reduce doens't solve it)

