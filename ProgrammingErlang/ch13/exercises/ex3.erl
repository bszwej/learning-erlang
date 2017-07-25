-module(ex3).
-export([test/0, some_fun/1, my_spawn/4]).

test() ->
  my_spawn(?MODULE, some_fun, [1000], 500).

some_fun(Suicide_time) ->
  io:format("Hello from ~p. I'm gonna die in ~pms.~n", [self(), Suicide_time]),
  timer:sleep(Suicide_time),
  io:format("Killing myself..."),
  exit(suicide).

my_spawn(Mod, Func, Args, Time) ->
  Pid = spawn(Mod, Func, Args),
  receive
  after
    Time ->
      io:format("Pid '~p' is living for more than ~pms. Killing.", [Pid, Time]),
      exit(Pid, timed_out)
  end.
