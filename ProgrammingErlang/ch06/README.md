# Chapter 6: Error Handling in Sequential Programs

- In sequential program, where you have only 1 process it's very important that this process does not fail. In erlang, on the other hand, processes can fail. Processes can monitor other processes and take over whatever the crashed process was supposed to be doing.
- Erlang has exceptions and even try..catch
- Defensive programming is build-in in Erlang. You only specify functions for your input, otherwise an exception is thrown. **You should never return a value for wrong inputs**. This rule is called *Let it crash*.
- Everything in Erlang is an expression and returns a value
- You can generate error by using BIFs
    - exit(Why)
    - throw(Why)
    - error(Why)

``` erlang
try FuncOrExpressionSeq of
    Pattern1 [when Guard1] -> Expressions1;
    Pattern2 [when Guard2] -> Expressions2;
...
catch
    ExceptionType1: ExPattern1 [when ExGuard1] -> ExExpressions1;
    ExceptionType2: ExPattern2 [when ExGuard2] -> ExExpressions2;
...
after
    AfterExpressions
end
```

We can omit pattern matching:

``` erl
try F
catch
    ...
end
```

We can omit after section, too.

- Use `erlang:get_stacktrace().` to get the last stacktrace
- Erlang promotes failing noisily and fast. If a function has wrong input, it should immediately throw exception and user should handle it in his way.

## TODO

- [ ] Exercise 2.
