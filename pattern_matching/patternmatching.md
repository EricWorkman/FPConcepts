#Pattern Matching

So, assignment eh...

x = 2
y = 3

Yeah... that's not really a thing in Elixir (assignment that is).

Instead, in Elixir '=' is the Match Operator

Let's look at how joyfully weird this is for a minute:

```
iex> foo_bar = 42
42

iex> 42 = foo_bar
42

iex> 43 = foo_bar
** (MatchError) no match of right hand side value: 42

```
So, when would you do this IRL? This example, prolly never... but maybe we should look at something a bit more powerful:







