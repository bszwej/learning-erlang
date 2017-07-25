-module(ex3).
-export([start/2, start/4, loop/2]).

start(NoProcesses, NoRounds) ->
  NextProcess = lists:foldl(
    fun(Id, Pid) -> spawn(ex3, loop, [Id, Pid]) end,
    self(),
    lists:seq(1, NoProcesses)
  ),
  statistics(wall_clock),
  self() ! token,
  start(NextProcess, NoProcesses, NoRounds, NoRounds).

start(_, NoProcesses, NoRounds, 0) ->
  receive
    token ->
      {_, ElapsedMS} = statistics(wall_clock),
      io:format("NoProcesses: ~p | NoRounds: ~p~n", [NoProcesses, NoRounds]),
      io:format("Elapsed ~pms.~n", [ElapsedMS])
  end;

start(NextProcess, NoProcesses, NoRounds, CurrentRound) ->
  receive
    token ->
      %io:format("In start PID '~p'. Sending token to PID '~p'.~n", [self(), NextProcess]),
      NextProcess ! token
  end,
  start(NextProcess, NoProcesses, NoRounds, CurrentRound - 1).

loop(Id, Pid) ->
  receive
    token ->
      %io:format("In ID '~p' PID '~p'. Sending token to PID '~p'.~n", [Id, self(), Pid]),
      Pid ! token,
      loop(Id, Pid)
  end.