defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """

  @spec commands(code :: integer) :: list(String.t())
  # https://hexdocs.pm/elixir/Bitwise.html
  # https://en.wikipedia.org/wiki/Bitwise_operation
  use Bitwise
  #create a map with actions
  @actions %{
    0b1 => "wink",
    0b10 => "double blink",
    0b100 => "close your eyes",
    0b1000 => "jump"
  }
  def commands(code) do
    # map(col, fun): executes the function for each item in col
    # so the funtion will be executed for each action.
    # Bitwise application:
    # if (code is equal to bit) then return the action
    # (bit &&& code) === bit
    Enum.map(
      @actions,
      fn({bit, action}) ->
        if (bit &&& code) === bit do
          action
        end
      end)
    # returns nil if code doens't match,
    # add filter to return only if action is not nil
    |> Enum.filter(fn(action) -> action != nil end)
    |> reverse?((code &&& 0b10000) === 0b10000)
  end

  # reverse, if true
  def reverse?(array, true) do
    Enum.reverse(array)
  end

  # return array, if false or _ (match any value)
  def reverse?(array, false) do
    array
  end
end

