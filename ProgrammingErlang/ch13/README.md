# Chapter 13: Errors in Concurrent Programs

- Sequential languages promote defensive programming. If anything fails in a sequential program, we're in trouble. In Erlang we write a small amount of defensive code, and focus on writing corrective code instead.
- We correct errors after they occurred.

> Getting Some Other Guy to Fix It
  Letting somebody else fix an error rather than doing it yourself is a good idea and
  encourages specialization. If I need surgery, I go to a doctor and don’t try to operate
  on myself.
  If something trivial in my car goes wrong, the car’s control computer will try to fix it.
  If this fails and something big goes wrong, I have to take the car to the garage, and
  some other guy fixes it.
  If something trivial in an Erlang process goes wrong, I can try to fix it with a catch or
  try statement. But if this fails and something big goes wrong, I’d better just crash and
  let some other process fix the error.
  
- processes
    - normal (can be promoted to system by BIF `process_flag(trap_exit, true).`)
    - system
- links - processes can be linked. If A and B are linked, then if A dies, B receives a signal.
- link set - linkset of process P is a set of processes which P is linked with
- monitors - just like links, but support only one direction. If A monitors B, then if B dies, A receives a `down` message.
- there are 2 communication channels between processes: messages and error signals
- when a monitored process dies, a “down” message and not an exit signal
  is sent to the monitoring process. This means that the monitoring process
  does not have to become a system process in order to handle errors.
  
- BIFs:
    - `spawn_link(Fun) -> Pid` - like spawn, but also creates a link between parent and child
    - `spawn_monitor(Fun) -> Pid`
    - `process_flag(trap_exit, true)`
    - `link(Pid)`
    - `unlink(Pid)`
    - `erlang:monitor(process, Item) -> Ref`
    - `exit(Why) -> none()` - causes current process to terminate without a reason
    - `list_to_pid("<0.65.0>")` - returns pid from string
    
- Quickly kill process in erlang shell: `erlang:exit(list_to_pid("<0.71.0>"), reason).`

## Questions

- What's the use of references returned by monitor?
