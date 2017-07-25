-module(ex1).
-export([test/0, start/2]).

test() ->
  spawn(ex1, start, [name, fun() -> io:format("Hello from ~p~n", [self()]) end]),
  spawn(ex1, start, [name, fun() -> io:format("Hello from ~p~n", [self()]) end]).

start(AnAtom, Fun) ->
  case whereis(AnAtom) of
    undefined -> register(RegName = AnAtom, PidOrPort = spawn(Fun));
    _ -> io:format("Atom already assigned to a process.")
  end.
