defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase |> String.split |> match |> Enum.join(" ")
  end

  def match([]), do: []
  def match([head|tail]) do
    cond do
      Enum.member?(["sch", "thr", "squ"], (f = String.slice(head, 0..2))) ->
        m = String.slice(head, 3, String.length(head))
        [m <> f <> "ay"] ++ match(tail)

      Enum.member?(["qu", "th", "ch"], (f = String.slice(head, 0..1))) ->
        m = String.slice(head, 2, String.length(head))
        [m <> f <> "ay"] ++ match(tail)

      Enum.member?(["xr", "yt"], String.slice(head, 0..1)) ->
        [head <> "ay"]  ++ match(tail)

      Enum.member?(["a", "e", "i","o", "u"], String.slice(head, 0..0)) ->
        [head <> "ay"]  ++ match(tail)

      true ->
        f = String.slice(head, 0..0)
        m = String.slice(head, 1, String.length(head))
        [m <> f <> "ay"]  ++ match(tail)
    end
  end
end

# 1 pick most difficult test
# 2 loop: recursion for each word OR replace with regex
# 3 sliced word goes into pattern match
# 4. pick apart the problem piece by piece

# improved solution @xingzaizhailu

    # # equals: @vowels ["a", "e", "i", "o", "u", "yt", "xr"]
    # @vowels ~w(a e i o u yt xr)
    # @consonants_2 ~w(ch qu th)
    # @consonants_3 ~w(squ thr sch)

    # @spec translate(phrase :: String.t()) :: String.t()
    # def translate(phrase) do
    #   phrase
    #   |> String.split
    #   |> Enum.map(&translate_one/1)
    #   |> Enum.join(" ")
    # end

    # def translate_one(phrase) do
    #   case String.starts_with?(phrase, @vowels) do
    #     true ->
    #       phrase <> "ay"
    #     _ ->
    #       head_size =
    #         cond do
    #           String.starts_with?(phrase, @consonants_3) -> 3
    #           String.starts_with?(phrase, @consonants_2) -> 2
    #           # if not a vowel or edge case, its a consonant:
    #           true -> 1
    #         end
    #       #slice the last part of the string and concatenate with the first part
    #       String.slice(phrase, head_size..-1) <> String.slice(phrase, 0..(head_size-1) ) <> "ay"
    #   end
    # end
    # end

# solution @buffalocoder

  # def translate(phrase) do
  #   phrase
  #   |> String.split
  #   |> Enum.map(&translate_word/1)
  #   |> Enum.join(" ")
  # end

  # def translate_word(word) do
  #   if Regex.match?(~r/\b([aeiou]|yt|xr).*/, word) do
  #       word <> "ay"
  #   else
  #       Regex.replace(~r/\b(ch|qu|squ|thr|th|sch|.)(.*)/, word, "\\2\\1ay")
  #   end
  # end
