-module(map_search_pred).
-export([map_search_pred/2, test/0]).

test() ->
  F = fun (K, V) -> K==V end,
  {b, b} = map_search_pred(#{a => 1, b => b, c => 3}, F),
  not_found = map_search_pred(#{a => 1, b => 2, c => 3}, F),
  tests_passed.

map_search_pred([], _) ->
  not_found;

map_search_pred([{K, V} | T], Pred) ->
  case Pred(K, V) of
    true -> {K, V};
    false -> map_search_pred(T, Pred)
  end;

map_search_pred(Map, Pred) ->
  map_search_pred(maps:to_list(Map), Pred).
