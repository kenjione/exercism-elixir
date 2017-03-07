defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/(?:[A-Z])|(?:\s{1}[a-z])/, string)
    |> List.flatten
    |> Enum.join
    |> String.replace(" ", "")
    |> String.upcase
  end
end
