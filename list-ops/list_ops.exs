defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l, 0)
  end

  defp _count([], total), do: total
  defp _count([_head|tail], total), do: _count(tail, total + 1)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], acc), do: acc
  defp _reverse([head|tail], acc), do: _reverse(tail, [head|acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f)
  end

  defp _map([], _func), do: []
  defp _map([head|tail], func), do: [func.(head)|_map(tail, func)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f)
  end

  defp _filter([], _func), do: []
  defp _filter([head|tail], func) do
    cond do
      func.(head) ->
        [head|_filter(tail, func)]
      true ->
        _filter(tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, _), do: acc
  defp _reduce([head|tail], acc, func), do: _reduce(tail, func.(head, acc), func)

  @spec append(list, list) :: list
  def append(a, b) do
    _append(reverse(a), b)
  end

  defp _append([], []), do: []
  defp _append([], b), do: b
  defp _append([head|tail], b), do: _append(tail, [head|b])

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    _concat(ll)
  end

  defp _concat([]), do: []
  defp _concat([head|tail]), do: reduce(reverse([head|tail]), [], &(append(&1, &2)))
end
