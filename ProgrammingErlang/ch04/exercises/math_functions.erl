-module(math_functions).
-export([test_even_odd/0, test_filters/0, filter/2, test_splits/0]).

% --- dummy tests
test_even_odd() ->
  true = even(2),
  true = even(0),
  false = even(1),
  true = odd(1),
  false = odd(2),
  even_odd_tests_passed.

test_filters() ->
  test_filter(fun filter/2),
  test_filter(fun filter2/2),
  filters_tests_passed.

test_filter(F) ->
  [2, 4] = F(fun even/1, [1, 2, 3, 4, 5]),
  [1, 3, 5] = F(fun odd/1, [1, 2, 3, 4, 5]),
  [] = F(fun even/1, []),
  [] = F(fun odd/1, []).

test_splits() ->
  {[2,4], [1,3,5]} = split([1,2,3,4,5]),
  {[2,4], [1,3,5]} = split2([1,2,3,4,5]),
  split_tests_passed.

% --- even / odd
even(N) when is_integer(N) ->
  N rem 2 == 0.

odd(N) ->
  not even(N).

% --- filter using recursion
filter(F, L) ->
  filter(F, L, []).

filter(_, [], L) ->
  lists:reverse(L);

filter(F, L, Acc) ->
  [H | T] = L,
  case F(H) of
    true -> filter(F, T, [H | Acc]);
    false -> filter(F, T, Acc)
  end.

% --- filter using list comprehensions
filter2(F, L) ->
  [X || X <- L, F(X) == true].

% --- split using accumulators
split(L) ->
  split(L, [], []).

split([], Even, Odd) ->
  {lists:reverse(Even), lists:reverse(Odd)};

split([H | T], Even, Odd) ->
  case even(H) of
    true -> split(T, [H | Even], Odd);
    false -> split(T, Even, [H | Odd])
  end.

% --- split using filter
split2(L) ->
  {filter(fun even/1, L), filter(fun odd/1, L)}.
