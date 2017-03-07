defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([], [nil]), do: :sublist
  def compare([nil], []), do: :superlist
  def compare(a, b) do
    cond do
      a == b -> :equal
      included?(a, b) -> :sublist
      included?(b, a) -> :superlist
      true -> :unequal
    end
  end

  def included?(element, wrapper) do
    wrapper
    |> Enum.map_join(&mapper/1)
    |> String.contains?(Enum.map_join element, &mapper/1)
  end

  def mapper(value), do: "[#{value}]"
end
