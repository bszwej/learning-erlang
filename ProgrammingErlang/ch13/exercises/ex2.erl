-module(ex2).
-export([test/0, some_fun/0, my_spawn/3, on_exit/2]).

test() ->
  my_spawn(?MODULE, some_fun, []).

some_fun() ->
  io:format("Hello from ~p. Now I'm gonna die.~n", [self()]),
  timer:sleep(1000),
  exit(some_nasty_reason).

my_spawn(Mod, Func, Args) ->
  Cb = fun(Why) ->
    {_, Elapsed} = statistics(wall_clock),
    io:format("Process died because of '~p' after ~pms.~n", [Why, Elapsed])
       end,
  statistics(wall_clock),
  Pid = spawn(Mod, Func, Args),
  on_exit(Pid, Cb).

on_exit(Pid, Fun) ->
  spawn(fun() ->
    Ref = monitor(process, Pid),
    receive
      {'DOWN', Ref, process, Pid, Why} ->
        Fun(Why)
    end
        end).
