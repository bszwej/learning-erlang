-module(ex2).
-export([test/0, term_to_packet/1]).

test() ->
  <<0, 0, 0, 10, 131, 100, 0, 6, 98, 97, 114, 116, 101, 107>> = term_to_packet(bartek),
  tests_passed.

term_to_packet(Term) ->
  Data = term_to_binary(Term),
  Length = byte_size(Data),
  <<Length:32, Data:Length/binary>>.
