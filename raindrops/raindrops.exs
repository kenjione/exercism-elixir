defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @drops %{3 => "Pling", 5 => "Plang", 7 => "Plong" }

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    string = build_string(number)
    case string do
      "" -> "#{number}"
      __ -> string
    end
  end

  defp build_string(number) do
    Map.keys(@drops)
    |> Enum.reduce("", &add_drop(number, &1, &2))
  end

  defp add_drop(number, factor, acc) do
    acc <> drop(number, factor, @drops[factor])
  end

  defp drop(number, factor, text) do
    case rem(number, factor) do
      0 -> text
      _ -> ""
    end
  end
end
