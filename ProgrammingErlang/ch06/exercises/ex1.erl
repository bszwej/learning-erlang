-module(ex1).
-export([test/0, read/1]).

test() ->
  true = is_binary(read("myfile.erl")),
  unreadable_file_error = (catch read("non_existing_file")),
  tests_passed.

read(File) ->
  case file:read_file(File) of
    {ok, Bin} -> Bin;
    {error, _} -> throw(unreadable_file_error)
  end.
