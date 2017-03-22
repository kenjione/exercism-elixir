defmodule RotationalCipher do
  @alphabet 26
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(&shifting(&1, shift))
    |> List.to_string
  end

  defp shifting(char, shift) do
    cond do
      char in(?a..?z) -> mapping(?a, char, shift)
      char in(?A..?Z) -> mapping(?A, char, shift)
      true -> char
    end
  end

  defp mapping(from, char, shift) do
    normalized = char - from + @alphabet
    from + rem(normalized + rem(shift, @alphabet), @alphabet)
  end
end
