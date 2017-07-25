-module(my_tuple_to_list_v1).
-export([test/0]).

test() ->
  [] = my_tuple_to_list({}),
  [1] = my_tuple_to_list({1}),
  [1,2] = my_tuple_to_list({1,2}),
  test_passed.

my_tuple_to_list({}) ->
  [];

my_tuple_to_list(T) ->
  my_tuple_to_list_acc(tuple_size(T), T, []).

my_tuple_to_list_acc(1, T, Acc) ->
  [element(1, T) | Acc];

my_tuple_to_list_acc(N, T, Acc) ->
  my_tuple_to_list_acc(N - 1, T, [element(N, T) | Acc]).
