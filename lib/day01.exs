defmodule AdventOfCode.Day01 do
  def run do
    IO.puts "Inverse Captcha: #{solve()}"
  end

  def solve do
    input()
    |> String.codepoints()
    |> add_first_last()
    |> sum_if_adjacent(0)
  end

  def sum_if_adjacent([_], sum), do: sum
  def sum_if_adjacent([a, a | rest] = list, sum) do
    {int, ""} = Integer.parse(a)
    [a | rest]
    |> sum_if_adjacent(sum + int)
  end
  def sum_if_adjacent([a, b | rest] = list, sum) do
    [b | rest]
    |> sum_if_adjacent(sum)
  end

  defp add_first_last([head | _tail] = list) do
    tsil = list |> Enum.reverse()
    [head | tsil] |> Enum.reverse()
  end

  defp input do
    "lib/inputs/day1_0.txt" |> File.read!() |> String.strip()
  end
end

AdventOfCode.Day01.run()
