defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
      string
      |> String.graphemes()
      |> Enum.chunk_by(& &1)
      |> Enum.map(& to_string(&1))
      |> Enum.reduce("",
        fn(x, acc) ->
          acc
          <> to_string(if String.length(x) == 1 do else String.length(x) end)
          <> String.first(x)
        end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.graphemes()
    |> Enum.map(fn(x)->
         cond do
           Regex.run(~r/([0-9])/, String.first(x)) -> x
           x -> "#{x}."
         end
       end)
    |> Enum.join()
    |> String.split(".", trim: true)
    |> Enum.map(fn x ->
      if String.length(x)-1 == 0 do
        x
      else
        String.duplicate(
          String.slice(x, String.length(x)-1, 1),
          String.to_integer(String.slice(x, 0..(String.length(x)-2))))
      end
    end)
    |> Enum.join()
  end
end

# with help from https://stackoverflow.com/q/36392742/6430382
