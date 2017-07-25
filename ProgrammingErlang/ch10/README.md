# Chapter 10: Compiling and Running Your Program

- BEAM has load path (= classpath in jvm)
- It loads on demand
- Use `code:get_path().` to see load path
- You can manually add entry to load path using special BIF
    - or start erl with `-pa DIr1 -pa Dir2` flags
- Put a code in .erlang file and it'll be loaded when erl starts

## Different ways of running code

- using erl by `c(module).`
- using erlc:
    1. `erlc hello.erl`
    2. `erl -noshell -s hello start -s init stop`
- Running as escript

``` erlang
#!/usr/bin/env escript

main(Args) ->
    io:format("Hello, world!").
```
