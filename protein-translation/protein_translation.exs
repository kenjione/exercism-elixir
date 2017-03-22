defmodule ProteinTranslation do
  @codons %{
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

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
    |> String.graphemes
    |> Enum.chunk(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.reduce_while([], &assign/2)
    |> validate
  end

  defp assign(codon, acc) do
    case @codons[codon] do
       "STOP" -> { :halt, acc }
       nil    -> { :halt, :invalid }
       value  -> { :cont, acc ++ [value] }
    end
  end

  defp validate(rna) do
    case rna do
      :invalid -> { :error, "invalid RNA"}
      ________ -> { :ok, rna }
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  """

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case @codons[codon] do
      nil -> { :error, "invalid codon" }
      __  -> { :ok, @codons[codon] }
    end
  end
end
