defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Enum.reduce(words(sentence), %{}, fn word, acc ->
      Map.put(acc, String.downcase(word), count_of(words(sentence), word))
    end)
  end

  def count_of(list, elem) do
    Enum.count(list, &(compare(&1, elem)))
  end

  def words(sentence) do
    Regex.scan(~r/(?:\p{L}|\p{N}|-|[^\x00-\x7F])+/, sentence) |> List.flatten
  end

  def compare(first, second) do
    String.downcase(first) == String.downcase(second)
  end
end
