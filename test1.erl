-module (test1).
-export ([test/0]).
-export([count_characters/1, count_characters/2]).


%% erlang R17 版本以后有 map类型 

% test() ->
% 	F1 = #{ a => 1, b => 2}.

count_characters(Str) ->
        count_characters (Str, #{}).

count_characters ( [H|T], #{H => N} = X)->
        count_characters (T, X#{H := N + 1});
count_characters ([H|T], X) ->
        count_characters (T, X#{H => 1});
count_characters ([], X) ->
        X.