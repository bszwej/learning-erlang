-module(ex4).
-export([test/0]).

test() ->
  Packet = ex2:term_to_packet(bartek),
  bartek = ex3:packet_to_term(Packet),
  tests_passed.
