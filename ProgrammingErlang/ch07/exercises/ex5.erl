-module(ex5).
-export([test/0, reverse_bits/1]).

test() ->
  <<0, 1>> = reverse_bits(<<2#10000000, 2#00000000>>),
  <<2#10100000>> = reverse_bits(<<2#00000101>>),
  tests_passed.

reverse_byte(Byte) ->
  <<B1:1, B2:1, B3:1, B4:1, B5:1, B6:1, B7:1, B8:1>> = Byte,
  Reverse = <<B8:1, B7:1, B6:1, B5:1, B4:1, B3:1, B2:1, B1:1>>,
  <<Value:8>> = Reverse,
  Value.

reverse_bits(Bin) ->
  <<<<(reverse_byte(<<X>>))>> || <<X>> <= ex1:reverse_bytes2(Bin)>>.
