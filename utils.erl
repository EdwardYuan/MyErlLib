-module (utils).
-export ([for_ins/3, for_ins/4, for_dec/3, for_dec/4]).
%%% This module provides some useful functions 

%% for_ins(I, Max, F) equals to for(int i, Max, i++) in C 
for_ins(Max, Max, F) -> [F(Max)];
for_ins(I, Max, F) -> [F(I)| for_ins(I + 1, Max, F)].

%% for_dec(I, Max, F) equals to for(i, Min, --i) in C
for_dec(Min, Min, F) -> [F(Min)];
for_dec(I, Min, F) -> [F(I)| for_dec(I - 1, Min, F)].

%% use K instead 1 as the step 
for_ins(Max, Max, _, F) -> [F(Max)];
for_ins(I, Max, K, F) -> 
	case I =< Max of 
		true ->
		    [F(I) | for_ins(I + K, Max, K, F)];
		false ->
		    error
	end.

%% use K instead 1 as the step
for_dec(Min, Min, F, _) -> [F(Min)];
for_dec(I, Min, F, K) -> 
	case I >= Min of 
		true ->
   		    [F(I) | for_dec(I - K, Min, F, K)];
		false ->
		    error
	end.
