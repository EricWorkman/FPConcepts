# Recursion


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

[Elixir Getting Started](http://elixir-lang.org/getting-started/recursion.html)
[relevant xkcd](http://xkcd.com/1270)