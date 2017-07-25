# Chapter 4: Modules and Functions

## 4.1 Module Are Where We Store Code (modules, clauses, pattern matching)
- Exported methods are like public methods in OOP, not exported - private

``` erl
area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.
```

The above function:
- is one function
- consists of 2 clauses. 
- *head* -> *body*
- body consists of expressions
- return value = last expression as in Scala

Quick dirty test using pattern matching:

``` erl 
test() ->
  12 = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  tests_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.
```

- area function does not handle a case that no pattern matches. *This is the way we write program in Erlang.*
- In C version, the area function would have multiple if else
- In Java you would use polymorphism. In Erlang the code is all in one place.
- comma is short-range, semicolon medium-range, period is long range.

## 4.2 Back to Shopping

``` erl
total([{What, N}|T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.
```

- List pattern matching, where the head is a tuple.
- Recursion is referential transparent.

## 4.3, 4.4 Funs

- Erlang has list comprehensions. Awesome.

> When I’m writing a program, my approach is to “write a bit” and then “test a bit.” I start with a small module with a few functions, and then I compile it and test it with a few commands in the shell. Once I’m happy with it, I write a few more functions, compile them, test them, and so on.
Often I haven’t really decided what sort of data structures I’ll need in my program, and as I run small examples, I can see whether the data structures I have chosen are appropriate.
I tend to “grow” programs rather than think them out completely before writing them. This way I don’t tend to make large mistakes before I discover that things have gone wrong. Above all, it’s fun, I get immediate feedback, and I see whether my ideas work as soon as I have typed in the program.
Once I’ve figured out how to do something in the shell, I usually then go and write a makefile and some code that reproduces what I’ve learned in the shell.


## 4.5 List Comprehensions

``` erl
14> L=[1,2,3,4,5].
[1,2,3,4,5]
15> [2*X || X <- L].
[2,4,6,8,10]
```

- `[2*X || X <- L].` = "The list of 2*X where X is taken from the list L"


Other cool examples:
- `[{Item, 2*Number} || {Item, Number} <- Buy].`
    - The tuple on the right is a pattern, that matches every element of Buy list. The tuple on the left side is a constructor.

- `lists:sum([shop:cost(Item) * Number || {Item, Number} <- Buy]).`
- Generator part of a list comprehension works like a filter:

``` erl
31> [X || {5, X} <- [{4, 2}, {5, 2}, {6, 2}]].
[2]
```

## 4.6 BIFs
- BIFs are implemented in Erlang, but most of them are BEAM primitives
- BIFs belong to the module `erlang`, though the most common BIFs (e.g. list_to_tuple) are autoimported

## 4.7 Guards
- Guards are used for testing and comparing when matching patterns

``` erl
max(X, Y) when X>Y -> X;
max(_, Y) -> Y.
```

- There are lots of built-in guard predicates
- `case of` lets pattern match an expression
``` erl
filter(P, [H|T]) ->
  case P(H) of
    true -> [H|filter(P, T)];
    false -> filter(P, T)
  end;
filter(_, []) -> [].
```
- `if` expression
``` erl
testIfExpression(N) ->
  if N == 2 -> ok;
    N == 3 -> ok2
  end.
  ```
## 4.8 Building lists in natural order

- Never use `List ++ [H]`

 ## 4.9 Accumulators

- An example below lets traverse the list once returning 2 lists

``` erl
odds_and_evens(L) ->
  odds_and_evens(L, [], []).

odds_and_evens([H|T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens(T, [H|Odds], Evens);
    0 -> odds_and_evens(T, Odds, [H|Odds])
  end;

odds_and_evens([], Odds, Evens) ->
  {Odds, Evens}.
 ```
