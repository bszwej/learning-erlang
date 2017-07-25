-module(my_tuple_to_list_v2).
-export([test/0]).

test() ->
  [] = my_tuple_to_list({}),
  [1] = my_tuple_to_list({1}),
  [1,2] = my_tuple_to_list({1,2}),
  test_passed.

my_tuple_to_list(T) ->
    my_tuple_to_list(T, []).

my_tuple_to_list({}, Acc) ->
  lists:reverse(Acc);

my_tuple_to_list(T, Acc) ->
  Element = element(1, T),
  my_tuple_to_list(erlang:delete_element(1, T), [Element | Acc]).
