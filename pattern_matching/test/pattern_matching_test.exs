defmodule PatternMatchingTest do
  use ExUnit.Case
  doctest PatternMatching
  alias PatternMatching.{User, Role}

  test "A few simple cases of matching" do
    foo = 42
    42 = foo
    #TODO uncomment for the lolz!
    #43 = foo
  end

  test "A more interesting example" do
    new_programmer = %User{}
    assert User.greet(new_programmer) == "Well hello! Let's learn you some Elixir"

    alchemist = %User{user_name: "Dave", language: %{language_name: "Elixir"}}
    assert User.greet(alchemist) == "Hi Dave! Let's high-five and write some Elixir!"

    bob = %User{user_name: "Bob", language: %{language_name: "Ruby"}}

    assert User.greet(bob) == "Hey, Bob's back and he learned Ruby!"

  end
end
