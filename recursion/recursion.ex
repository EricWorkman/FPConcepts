defmodule Recursion do
	
	def stack_overflow_sum(0), do: 0
	def stack_overflow_sum(num), do: num + stack_overflow_sum(num - 1)

	def tail_recursive_sum(0, acc), do: acc
	def tail_recursive_sum(num, acc), do: tail_recursive_sum(num - 1, acc + num)
end
