-module(ex1).
-export([test/0, some_fun/0, my_spawn/3]).

test() ->
  my_spawn(?MODULE, some_fun, []).

some_fun() ->
  io:format("Hello from ~p. Now I'm gonna die.~n", [self()]),
  timer:sleep(1000),
  exit(some_nasty_reason).

my_spawn(Mod, Func, Args) ->
  spawn(
    fun() ->
      spawn_monitor(Mod, Func, Args),
      statistics(wall_clock),
      receive
        {'DOWN', _, process, Pid, Why} ->
          {_, Elapsed} = statistics(wall_clock),
          io:format("Process with PID '~p' died after ~pms because of '~p'.~n", [Pid, Elapsed, Why])
      end
    end
  ).
