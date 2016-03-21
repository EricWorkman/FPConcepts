# Immutability
Immutability in functional programming is the concept that data is never changed once it is created. Any modifications to data involve creating new storage and leaving the original data unchanged. The value of this is in the restriction it places on functions from having side effects. Consider the following python code:
```python
>>> def process(list):
...     list.reverse()
...     return list
... 
>>> initial = ["a", "b", "c"]
>>> process(initial)
['c', 'b', 'a']
>>> initial
['c', 'b', 'a']
```
The manipulation of data occurs in place, so the `process` function has side effects. Compare that to the following elixir code:
```elixir
iex(1)> defmodule ListProcess do
...(1)> def process(list) do    
...(1)> Enum.reverse(list)
...(1)> end
...(1)> end
{:module, ListProcess,
 <<70, 79, 82, 49, 0, 0, 5, 104, 66, 69, 65, 77, 69, 120, 68, 99, 0, 0, 0, 137, 131, 104, 2, 100, 0, 14, 101, 108, 105, 120, 105, 114, 95, 100, 111, 99, 115, 95, 118, 49, 108, 0, 0, 0, 3, 104, 2, ...>>,
 {:process, 1}}
iex(2)> initial = ["A", "B", "C"]
["A", "B", "C"]
iex(3)> ListProcess.process(initial)
["C", "B", "A"]
iex(4)> initial
["A", "B", "C"]
```
In the elixir code, the initial list remains the same and more storage is used to store the modified list from the `process` function.

## Benefits
Many developers new to functional programming may be confused as to why the programming language designers would choose to limit the ways for developers to express ideas in code. The constraint of immutability allows developers to reason about their functions more similarly to how they think about mathematical functions compared to those of other programming styles. Since all data enters the function as arguments and all results leave as return values, developers can reason about the domain and range that their functions have. An obvious benefit of this is in the realm of testing. If a developer can easily reason about the edge cases a function will have, the tests almost write themselves.

Another benefit is the ease of understanding exactly where data will change in the context of concurrent and parallel programming. Because data is immutable, any processing on one thread cannot impact data on other threads. While many languages require the programmer to consider locks, mutexes, and semaphores, languages with immutability usually allow the developer to leave those concerns to the architectural level of the application. Elixir programs handle synchronizing data between processes using [message passing between processes](http://elixir-lang.org/getting-started/processes.html#send-and-receive). A caveat to this pattern is that data must be deep-copied to be sent to another process, so it is important to consider when architecting the messaging scheme.
