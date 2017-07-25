-module(ex5).
-export([start_and_watch/0, loop/0, restart_on_exit/1]).

start_and_watch() ->
  restart_on_exit(spawn(?MODULE, loop, [])),
  restart_on_exit(spawn(?MODULE, loop, [])),
  restart_on_exit(spawn(?MODULE, loop, [])),
  restart_on_exit(spawn(?MODULE, loop, [])).

loop() ->
  receive
  after 5000 -> io:format("I'm still running (~p)!~n", [self()]),
    loop()
  end.

restart_on_exit(Pid) ->
  spawn(fun() ->
    monitor(process, Pid),
    receive
      {'DOWN', _, process, Pid, _} ->
        NewPid = spawn(?MODULE, loop, []),
        io:format("Recreated process '~p'~n.", [NewPid]),
        restart_on_exit(NewPid)
    end
        end).
