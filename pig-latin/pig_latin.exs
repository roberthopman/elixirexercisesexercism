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
  def match([h|t]) do
    cond do
      String.slice(h, 0..2) == ("sch") ->
        f = String.slice(h, 0..2)
        m = String.slice(h, 3, String.length(h))
        [m <> f <> "ay"]  ++ match(t)
      String.slice(h, 0..2) == ("thr") ->
        f = String.slice(h, 0..2)
        m = String.slice(h, 3, String.length(h))
        [m <> f <> "ay"]  ++ match(t)
      String.slice(h, 0..2) == ("squ") ->
        f = String.slice(h, 0..2)
        m = String.slice(h, 3, String.length(h))
        [m <> f <> "ay"]  ++ match(t)

      String.slice(h, 0..1) == ("qu") ->
        f = String.slice(h, 0..1)
        m = String.slice(h, 2, String.length(h))
        [m <> f <> "ay"] ++ match(t)
      String.slice(h, 0..1) == ("th") ->
        f = String.slice(h, 0..1)
        m = String.slice(h, 2, String.length(h))
        [m <> f <> "ay"] ++ match(t)
      String.slice(h, 0..1) == ("ch") ->
        f = String.slice(h, 0..1)
        m = String.slice(h, 2, String.length(h))
        [m <> f <> "ay"] ++ match(t)

      String.slice(h, 0..1) === ("xr") ->
        [h <> "ay"]  ++ match(t)
      String.slice(h, 0..1) === ("yt") ->
        [h <> "ay"]  ++ match(t)



      String.slice(h, 0..0) == ("a") ->
        [h <> "ay"]  ++ match(t)
      String.slice(h, 0..0) == ("e") ->
        [h <> "ay"]  ++ match(t)
      String.slice(h, 0..0) == ("i") ->
        [h <> "ay"]  ++ match(t)
      String.slice(h, 0..0) == ("o") ->
        [h <> "ay"]  ++ match(t)
      String.slice(h, 0..0) == ("u") ->
        [h <> "ay"]  ++ match(t)

      String.slice(h, 0..0) != ("consonants in regex") ->
        f = String.slice(h, 0..0)
        m = String.slice(h, 1, String.length(h))
        [m <> f <> "ay"]  ++ match(t)
    end
  end
end

# 1 pick most difficult test
# 2 loop: recursion for each word OR replace with regex
# 3 sliced word goes into pattern match
# 4. pick apart the problem piece by piece
