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

  @vowels ~w(a e i o u)
  @vowel_thing ~w(yt xr)
  @consonants_2 ~w(ch qu th)
  @consonants_3 ~w(squ thr sch)

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> match()
    |> Enum.join(" ")
  end

  def match([]), do: []

  def match([<< start :: binary-size(3), rest :: binary >> | tail]) when start in @consonants_3 do
    [rest <> start <> "ay"] ++ match(tail)
  end

  def match([<< start :: binary-size(2), rest :: binary >> | tail]) when start in @consonants_2 do
    [rest <> start <> "ay"] ++ match(tail)
  end

  def match([<< start :: binary-size(2), rest :: binary >> | tail]) when start in @vowel_thing do
    [start <> rest <> "ay"] ++ match(tail)
  end

  def match([<< start :: binary-size(1), rest :: binary >> | tail]) when start in @vowels do
    [start <> rest <> "ay"] ++ match(tail)
  end

  def match([<< start :: binary-size(1), rest :: binary >> | tail]) do
    [rest <> start <> "ay"] ++ match(tail)
  end
end
