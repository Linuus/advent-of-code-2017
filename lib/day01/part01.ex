defmodule AdventOfCode.Day01.Part01 do
  def run do
    IO.puts "Part 1: #{solve()}"
  end

  defp solve do
    input()
    |> String.codepoints()
    |> add_first_last()
    |> sum_if_adjacent(0)
  end

  defp sum_if_adjacent([_], sum), do: sum
  defp sum_if_adjacent([a, a | rest], sum) do
    {int, ""} = Integer.parse(a)
    [a | rest]
    |> sum_if_adjacent(sum + int)
  end
  defp sum_if_adjacent([_a, b | rest], sum) do
    [b | rest]
    |> sum_if_adjacent(sum)
  end

  defp add_first_last([head | _tail] = list) do
    tsil = list |> Enum.reverse()
    [head | tsil] |> Enum.reverse()
  end

  defp input do
    "lib/inputs/day1_0.txt" |> File.read!() |> String.trim()
  end
end
