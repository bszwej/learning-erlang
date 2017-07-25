-module(geometry).
-export([area/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, R}) -> math:pi() * R * R;
area({triangle, A, B}) -> 0.5 * A * B.
