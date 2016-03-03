defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(string) :: String.t
  def encode(string) do
    Regex.scan(~r/([A-Z])\1*/, string)
    |> Enum.map(fn [head|tail] -> head end)
    |> Enum.map(fn (word) -> Integer.to_string(String.length(word)) <> String.first(word) end)
    |> Enum.join
  end

  @spec decode(string) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
    |> Enum.map(fn [_, num, let] -> String.duplicate(let, String.to_integer(num)) end)
    |> Enum.join
  end
end
