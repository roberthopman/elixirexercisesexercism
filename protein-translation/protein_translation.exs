defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    # use the last test to start this exercise
    # seperate the string per 3 characters
    # use regex
    # look for A, G or U in pairs of 3 and split them if you find them,
    # include the value of 3 and trim the empty values.
    # for each of the triplets map over de of_codon
    names =
      ~r/[AGU]{3}/
      |> Regex.split(rna, include_captures: true, trim: true)
      |> Enum.map(&map_codon/1)
      |> stop

    if Enum.member?(names, "invalid codon") do
      {:error, "invalid RNA"}
    else
      {:ok, names}
    end
  end

  def map_codon(x) do
    case of_codon(x) do
     {_status, name} -> name
    end
  end

  def stop([]), do: []
  def stop(["STOP"|_tail]), do: []
  def stop([head|tail]) do
    [head] ++ stop(tail)
  end

  # recursion to substitute Enum.
  # def member?([], _str), do: false
  # def member?([hd | tl], str) do
  #   hd == str || member?(tl, str)
  # end
  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """

  @proteins %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    protein = @proteins[codon]

    if protein do
      {:ok, protein}
    else
      {:error, "invalid codon"}
    end
  end
end

