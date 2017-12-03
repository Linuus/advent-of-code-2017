defmodule AdventOfCode.Day01.Part02 do
  def run do
    IO.puts "Part 2: #{solve()}"
  end

  defp solve do
    input()
    |> Enum.split(split_index(input()))
    |> zip()
    |> maybe_sum(0)
    |> Kernel.*(2)
  end

  defp maybe_sum([], sum), do: sum
  defp maybe_sum([{a, a} | t], sum) do
    {a_int, ""} = Integer.parse(a)
    maybe_sum(t, sum + a_int)
  end
  defp maybe_sum([_ | t], sum), do: maybe_sum(t, sum)

  defp zip({first, last}) do
    Enum.zip(first, last)
  end

  defp split_index(list) do
    list
    |> length()
    |> div(2)
  end

  defp input do
    "lib/inputs/day1_0.txt"
    |> File.read!()
    |> String.trim()
    |> String.codepoints()
  end
end
