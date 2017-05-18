defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    # Increase count if nucleotide matches for char in strand
    # https://hexdocs.pm/elixir/1.2.6/Enum.html#count/2
    # Returns the count of char in the strand for which fn returns a truthy value.
    Enum.count(strand, fn(char) -> char == nucleotide end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do

    # 1. Display the map %{} having values equal to 0
    # https://hexdocs.pm/elixir/1.2.6/Map.html#new/2
    # Map.new(@nucleotides, fn(k) -> {k, 0} end)


    # 2. Display the map %{} having values equal to the char in strand
    # Instead of 0, count nucleotide in strand
    Map.new(@nucleotides, fn(k) -> {k, count(strand, k)} end)
  end
end
