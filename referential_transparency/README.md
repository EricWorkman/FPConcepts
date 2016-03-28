# Referential Transparency

WIP

```
An expression is said to be referentially transparent if it can be replaced with its value without changing the behavior of a program (in other words, yielding a program that has the same effects and output on the same input).
``` Wikipedia

Same inputs between calls == same outputs between calls

```python
def ref_opac(x, y):
    return x + y
```

```python
y = 1

def ref_opac(x):
    global y
    y += 1
    return x + y
```

In code, `ref_trans(1, 2)` can be thought of as `3` always.
In code, `ref_opac(1)` changes based on events external to `ref_opac` and cannot be thought of as `3` always.

```python
def ref_trans(x, y):
    return (y - x).total_seconds
```

```python
def ref_opac(x):
    y = datetime.now()
    return (y - x).total_seconds
```

In Elixir
