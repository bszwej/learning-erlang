-module(collatz_conjecture).
-export([steps/1, test_version/0]).

steps(N) when N > 0 -> steps(N, 0);
steps(_) -> {error, "Only strictly positive numbers are allowed"}.

steps(1, Count) -> Count;
steps(N, Count) when N rem 2 == 0 -> steps(N div 2, Count + 1);
steps(N, Count) -> steps(N * 3 + 1, Count + 1).

test_version() ->
  1.
