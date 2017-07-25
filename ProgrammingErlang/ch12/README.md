# Chapter 12: Concurrent Programming

- `Pid = spawn(Mod, Fun, Arg)`
- `Pid ! Msg`
- `Pid1 ! Pid2 ! Pid3 ! Msg`

```
receive
    Pattern1 [when Guard] ->
      Expression1;    
    Pattern2 [when Guard] ->
      Expression2;
end
```

- `for` loop

```erlang
for(N, N, F) -> [F()];
for(I, N, F) -> [F()|for(I+1, N, F)].
```

- `erlang:system_info(process_limit).` returns process limit. In order to increase it, use `+P` flag. `erl +P 3000000`


> If you’re writing a program that uses a large number of processes, it’s a good
  idea to find out how many processes can fit into physical memory before the
  system starts swapping memory to disk and to make sure that your program
  will run in physical memory.
  
- it's possible to receive with timeout in Erlang

```
receive
    Pattern1 [when Guard1] ->
      Expressions1;
    Pattern2 [when Guard2] ->
      Expressions2;
    ...
after Time ->
    Expressions
end
```

- `after` section is checked only after pattern matching has been performed on all the entries in the mailbox.
- `after infinity` is also correct

- you can:
    - `regster(Atom, Pid)`
    - `unregster(Atom)`
    - `whereis(AnAtom) -> Pid | undefined`
    - `registered() -> [AnAtom::atom()]`
    
- `MFA` stands for Module Function Args
