defmodule Bob do
  def hey(input) do
    cond do
      String.strip(input) == "" ->
        "Fine. Be that way!"
      String.upcase(input) == input and Regex.match?(~r/\p{Lu}/, input) ->
        "Whoa, chill out!"
      String.ends_with?(input, "?") ->
        "Sure."
      true ->
        "Whatever."
    end
  end
end
