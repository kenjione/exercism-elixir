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
    |> String.split("", trim: true)
    |> collapse
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> String.split(~r/\d*\D/, trim: true, include_captures: true)
    |> expand
    |> Enum.join
  end

  defp collapse([]), do: []
  defp collapse([ head | tail ], acc \\ [], count \\ 1) do
    cond do
      tail == [] -> acc ++ [counter(count, head)]
      List.first(tail) == head -> collapse(tail, acc, count + 1)
      true -> collapse(tail, acc ++ [counter(count, head)], 1)
    end
  end

  defp counter(1, letter), do: letter
  defp counter(count, letter), do: "#{count}#{letter}"

  defp expand(list) do
    Enum.reduce(list, [], fn e, acc ->
      [[count], [letter]] = Regex.scan(~r/^\d*|\D/, e)
      string = case count do
                 "" -> letter
                 __ -> String.duplicate(letter, String.to_integer(count))
               end
      acc ++ [string]
    end)
  end
end
