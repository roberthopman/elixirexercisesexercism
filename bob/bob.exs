defmodule Bob do
  def hey(input) do
    cond do
        String.ends_with? input, "?" -> "Sure."
        !String.match?(input, ~r/[[:lower:]]/) &&
        String.match?(input, ~r/[[:alpha:]]/) -> "Whoa, chill out!"
        String.trim(input) == "" -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end
end

# 1 Check structure of the problem
# 2 Group & Order tests. ?, YELL, empty, whatever
# 3 Solve
