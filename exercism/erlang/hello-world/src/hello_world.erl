-module(hello_world).

%% API
-export([hello/0, test_version/0]).

hello() ->
  "Hello, World!".

test_version() ->
  2.
