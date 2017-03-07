defmodule Bob do
  def hey(input) do
    cond do
      String.last(input) == "?"
        -> "Sure."
      String.trim(input) == ""
        -> "Fine. Be that way!"
      String.upcase(input) == input && String.match?(input,~r/\p{L}/)
        -> "Whoa, chill out!"
      true
        -> "Whatever."
    end
  end
end
