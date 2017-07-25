-module(ex1).
-export([test/0, reverse_bytes2/1]).

test() ->
  <<6, 5, 4, 3, 2, 1>> = reverse_bytes1(<<1, 2, 3, 4, 5, 6>>),
  <<6, 5, 4, 3, 2, 1>> = reverse_bytes2(<<1, 2, 3, 4, 5, 6>>),
  tests_passed.

reverse_bytes1(Bin) ->
  list_to_binary(lists:reverse(binary_to_list(Bin))).

reverse_bytes2(Bin) ->
  reverse_bytes2(Bin, <<>>).

reverse_bytes2(<<>>, Reversed) ->
  Reversed;

reverse_bytes2(<<H:1/binary, T/binary>>, Reversed) ->
  reverse_bytes2(T, <<H/binary, Reversed/binary>>).
