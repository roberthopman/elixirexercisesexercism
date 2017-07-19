defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    if list === nil, do: {elem}, else: {elem, list}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    count_length(list, 0)
  end
  defp count_length({}, n), do: n
  defp count_length({_, t}, n), do: count_length(t, n + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    if list === {}, do: true, else: false
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    if !LinkedList.empty?(list) do
      head = elem(list, 0)
      {:ok, head}
    else
      {:error, :empty_list}
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    if !LinkedList.empty?(list) do
      real_list = Tuple.to_list(list)
      [_ | tail] = real_list
      # tail = Enum.reverse(tail) # this line isn't necessary somehow
      tail = List.to_tuple(tail)
      tail = elem(tail, 0)
      {:ok, tail}
    else
      {:error, :empty_list}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    if !LinkedList.empty?(list) do
      real_list = Tuple.to_list(list)
      [_ | tail] = real_list
      tail = List.to_tuple(tail)
      tail = elem(tail, 0)
      head = elem(list, 0)
      {:ok, head, tail}
    else
      {:error, :empty_list}
    end
  end

  # @doc """
  # Construct a LinkedList from a stdlib List
  # """
  @spec from_list(list()) :: t
  def from_list(list) do
    List.foldr(list, new(), &push(&2, &1))
  end

  # @doc """
  # Construct a stdlib List LinkedList from a LinkedList
  # """
  @spec to_list(t) :: list()
  def to_list(list) do
    list |> do_to_list([]) |> Enum.reverse()
  end

  defp do_to_list({}, acc), do: acc
  defp do_to_list({h, t}, acc), do: do_to_list(t, [h|acc])

  # @doc """
  # Reverse a LinkedList
  # """
  @spec reverse(t) :: t
  def reverse(list) do
    do_reverse(list, new())
  end
  def do_reverse({}, acc), do: acc
  def do_reverse({h, t}, acc), do: do_reverse(t, push(acc, h))
end
# https://github.com/exercism/elixir/blob/master/exercises/simple-linked-list/example.exs
# its LIFO so add elements to the head of the list, instead of the tail
# for counting don't use tuple_size, but apply recursion
# tail is 1 item
