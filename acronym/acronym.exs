defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """

  @split_pattern ~r/(-|[^\w\p{P}])+/

  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(@split_pattern)
    |> Enum.map(&letters/1)
    |> Enum.join
  end

  defp letters(word) do
    word = String.capitalize(String.slice(word, 0..1)) <> String.slice(word, 1..-1)
    String.replace(word, ~r/[a-z]+|[^\w\s]+/, "")
  end
end
