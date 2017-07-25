-module(accumulate).
-export([accumulate/2, accumulate/3, test_version/0]).

accumulate(F, Xs) ->
  accumulate(F, Xs, []).

accumulate(_, [], Acc) ->
  lists:reverse(Acc);

accumulate(F, [H|T], Acc) ->
  accumulate(F, T, [F(H) | Acc]).

test_version() ->
  1.
