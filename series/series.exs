defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_, size) when size <= 0, do: []

  def slices(s, size) do
    String.graphemes(s)
    |> Enum.chunk(size, 1)
    |> Enum.map(&Enum.join/1)
  end


  # def slices(s, size) do
  #   0..String.length(s)
  #   |> Enum.reduce_while([], &slice(&1, &2, s, size))
  # end
  # 
  # def slice(index, acc, s, size) do
  #   str = String.slice(s, index, size)
  #   cond do
  #     String.length(str) < size -> {:halt, acc}
  #     true -> {:cont, acc ++ [str] }
  #   end
  # end
end
