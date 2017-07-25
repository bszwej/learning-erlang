-module(my_time).
-export([test_my_time_func/0, my_date_string/0]).

my_time_func(F) ->
  Start = erlang:monotonic_time(),
  F,
  End = erlang:monotonic_time(),
  End - Start.

test_my_time_func() ->
  my_time_func(fun(X) -> 2 * X end).

my_date_string() ->
  my_date_string(date(), time()).

my_date_string({Year, Month, Day}, {Hour, Minute, Second}) ->
  io:format("~w-~w-~w ~w:~w:~w", [Day, Month, Year, Hour, Minute, Second]).
