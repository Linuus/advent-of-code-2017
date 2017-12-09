defmodule AdventOfCode.Day02.Part01 do
  def run do
    IO.puts "Part 1: #{solve()}"
  end

  defp solve do
    input()
    |> Stream.map(&diffs/1)
    |> Enum.sum()
  end

  defp diffs(str) do
    str
    |> String.split("\t")
    |> Enum.map(&to_integer/1)
    |> Enum.min_max()
    |> calculate_diff()
  end

  defp calculate_diff({min, max}), do: max - min

  defp to_integer(str) do
    {int, _} = Integer.parse(str)
    int
  end

  defp input, do: File.stream!("lib/inputs/day2_0.txt")
end
