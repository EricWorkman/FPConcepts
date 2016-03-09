# Recursion
Recursion is the technique of calling a function inside itself. It is typically used to break work into increasingly smaller pieces and to combine the results into a complete solution. [Recursive merge sort](https://en.wikipedia.org/wiki/Merge_sort) is an example of this technique in action.

Recursive functions need to have at least one base case and at least one recursive case. The base case is the terminal function call. The classic example of this is the calculation of the nth value in the Fibonacci sequence. The sequence is defined as F<sub>0</sub> = 0, F<sub>1</sub> = 1, F<sub>n</sub> = F<sub>n-1</sub> + F<sub>n-2</sub>. In elixir, the function is implemented as follows:

```elixir
# base cases
def fib(0), do: 0
def fib(1), do: 1

# recursive case
def fib(num), do: fib(num - 1) + fib(num - 2)
```
Calling `fib(2)` results in `fib(2 - 1) + fib(2 - 2)`, which is `fib(1) + fib(0)`. Calling the two base cases results in `1 + 0` and sums to 1.

## Tail Recursion
Tail recursion is a specific form of recursion that requires the function call be the very last action of the function. This allows a compiler to translate the function to a looping structure and avoid adding to the program's stack.

```elixir
# assumes the Recursion example code is loaded into iex
iex(1)> Recursion.tail_recursive_sum(10, 0)
55
iex(2)> Recursion.stack_overflow_sum(10)
55
iex(3)> Recursion.tail_recursive_sum(10000000000, 0)
50000000005000000000
iex(4)> Recursion.stack_overflow_sum(10000000000)
Crash dump is being written to: erl_crash.dump...done
eheap_alloc: Cannot allocate 3280272216 bytes of memory (of type "heap").
Aborted (core dumped)
```
Tail recursion is used in Elixir for the GenServer pattern. GenServer stores state in a process via tail-recursively calling a function until the server gets a message to terminate. This is seen in the simplified [example](http://elixir-lang.org/getting-started/processes.html#state).

## Infinite Recursion
Infinite recursion is when recursion occurs without the potential of reaching a base case. If it is tail-recursive, it will never return. If it is not, it will result in a stack overflow.

```elixir
# base cases
def fib(0), do: 0

# recursive case
def fib(num), do: fib(num - 1) + fib(num - 2)
```
In the above example, we missed the case of `fib(1)`. When we call `fib(2)`, it becomes `fib(1) + fib(0)`. Because we missed the one base case of the recursion, the `fib(1)` becomes `fib(0) + fib(-1)`. The `fib(0)` returns 0, but the `fib(-1)` will call with increasingly larger negative values until the stack overflows.

### References
[Elixir Getting Started - Recursion](http://elixir-lang.org/getting-started/recursion.html)  
[relevant xkcd](http://xkcd.com/1270)
