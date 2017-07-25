-module(ex6).
-export([start_and_watch_all/0, loop/0, restart_on_exit/1]).

start_and_watch_all() ->
  Pids = [
    spawn(?MODULE, loop, []),
    spawn(?MODULE, loop, []),
    spawn(?MODULE, loop, [])
  ],
  [link(P) || P <- Pids],
  restart_on_exit(Pids).

loop() ->
  receive
  after 5000 -> io:format("I'm still running (~p)!~n", [self()]),
    loop()
  end.

restart_on_exit(Pids) ->
  spawn(fun() ->
    [H | _] = Pids,
    monitor(process, H),
    receive
      {'DOWN', _, process, OldPid, _} ->
        spawn(fun() ->
          io:format("Process '~p' died. Killing and recreating all others.", [OldPid]),
          [exit(P, reason) || P <- Pids],
          NewPids = [spawn_link(?MODULE, loop, []) || P <- Pids],
          restart_on_exit(NewPids),
          receive
            _ -> ok
          end
              end)
    end
        end).
