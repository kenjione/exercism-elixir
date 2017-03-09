defmodule ScrabbleConstant do
  @scores %{
    1 => ~w(A E I O U L N R S T),
    2 => ~w(D G),
    3 => ~w(B C M P),
    4 => ~w(F H V W Y),
    5 => ~w(K),
    8 => ~w(J X),
    10 => ~w(Q Z)
  }

  def scores, do: Enum.reduce @scores, %{}, &(Map.merge &2, split(&1))
  def split({score, words}), do: Enum.reduce words, %{}, &(Map.put_new(&2, &1, score))
end

defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @scores ScrabbleConstant.scores

  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.graphemes
    |> Enum.map(&score_per_word/1)
    |> Enum.sum
  end

  def score_per_word(word), do: @scores[String.upcase(word)] || 0
end
