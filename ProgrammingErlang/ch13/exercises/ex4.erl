-module(ex4).
-export([start/0, loop/0, restart_on_exit/1]).

start() ->
  Pid = spawn(?MODULE, loop, []),
  io:format("Created process '~p'~n.", [Pid]),
  register(my_process, Pid),
  restart_on_exit(Pid).

restart_on_exit(Pid) ->
  spawn(fun() ->
    monitor(process, Pid),
    receive
      {'DOWN', _, process, Pid, _} ->
        NewPid = spawn(?MODULE, loop, []),
        io:format("Recreated process '~p'~n.", [NewPid]),
        register(my_process, NewPid),
        restart_on_exit(NewPid)
    end
        end).

loop() ->
  %process_flag(trap_exit, true),
  receive
  after 5000 -> io:format("I'm still running (~p)!", [self()]),
    loop()
  end.
