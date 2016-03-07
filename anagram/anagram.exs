defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn(cand) -> anagram?(base, cand) end)
  end

  defp anagram?(base, cand) do
    cond do
      String.downcase(base) === String.downcase(cand) ->
        false
      true ->
        Enum.sort(to_char_list(String.downcase(base))) === Enum.sort(to_char_list(String.downcase(cand)))
    end
  end
end
