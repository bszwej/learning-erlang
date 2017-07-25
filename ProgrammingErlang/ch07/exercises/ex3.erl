-module(ex3).
-export([test/0, packet_to_term/1]).

test() ->
  bartek = packet_to_term(<<0,0,0,10,131,100,0,6,98,97,114,116,101,107>>),
  tests_passed.

packet_to_term(<<_:32, Data/binary>>) ->
  binary_to_term(Data).
