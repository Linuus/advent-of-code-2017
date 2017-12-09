defmodule AdventOfCode.Day02.Part02 do
  def run do
    IO.puts "Part 2: #{solve()}"
  end

  defp solve do
    input()
    |> Enum.map(&diffs/1)
    |> List.flatten()
    |> Enum.sum()
  end

  defp diffs(str) do
    str
    |> String.split("\t")
    |> Enum.map(&to_integer/1)
    |> find_even_divide()
  end

  defp find_even_divide(list) do
    for x <- list, y <- list, x != y, rem(x, y) == 0, do: div(x, y)
  end

  defp to_integer(str) do
    {int, _} = Integer.parse(str)
    int
  end

  defp input, do: File.stream!("lib/inputs/day2_0.txt")
end
