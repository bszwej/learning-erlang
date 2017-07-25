-module(rna_transcription).
-export([to_rna/1, test_version/0]).

to_rna($T) -> $A;
to_rna($A) -> $U;
to_rna($C) -> $G;
to_rna($G) -> $C;

to_rna(Code) ->
  [to_rna(X) || X <- Code].

test_version() ->
  1.
