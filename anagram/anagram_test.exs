if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("anagram.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule AnagramTest do
  use ExUnit.Case

#easy
  # @tag :pending
  test "no matches" do
    matches = Anagram.match "diaper", ["hello", "world", "zombies", "pants"]
    assert matches == []
  end
#easy
  # @tag :pending
  test "detect simple anagram" do
    matches = Anagram.match "ant", ["tan", "stand", "at"]
    assert matches == ["tan"]
  end
#diff 2
  # @tag :pending
  test "detect multiple anagrams" do
    matches = Anagram.match "master", ["stream", "pigeon", "maters"]
    assert matches == ["stream", "maters"]
  end
#edge
  # @tag :pending
  test "do not detect anagram subsets" do
    matches = Anagram.match "good", ~w(dog goody)
    assert matches == []
  end
#easy
  # @tag :pending
  test "detect anagram" do
    matches = Anagram.match "listen", ~w(enlists google inlets banana)
    assert matches == ["inlets"]
  end
#diff 1
  # @tag :pending
  test "multiple anagrams" do
    matches = Anagram.match "allergy", ~w(gallery ballerina regally clergy largely leading)
    assert matches == ["gallery", "regally", "largely"]
  end
#edge
  # @tag :pending
  test "anagrams must use all letters exactly once" do
    matches = Anagram.match "patter", ["tapper"]
    assert matches == []
  end
#edge easy
  # @tag :pending
  test "detect anagrams with case-insensitive subject" do
    matches = Anagram.match "Orchestra", ~w(cashregister carthorse radishes)
    assert matches == ["carthorse"]
  end
#edge easy
  # @tag :pending
  test "detect anagrams with case-insensitive candidate" do
    matches = Anagram.match "orchestra", ~w(cashregister Carthorse radishes)
    assert matches == ["Carthorse"]
  end
#diff 3
  # @tag :pending
  test "anagrams must not be the source word" do
    matches = Anagram.match "corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]
    assert matches == ["cron"]
  end
#edge
  # @tag :pending
  test "do not detect words based on checksum" do
    matches = Anagram.match "mass", ["last"]
    assert matches == []
  end
end
