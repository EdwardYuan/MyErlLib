-module (test).
-import (utils, [for_ins/3, for_dec/3, for_ins/4, for_dec/4]).
-import (algorithm, [qsort/1, pythag/1]).
-export ([test/0, test_for_inc/2, test_for_dec/2, test_for_ins_4/3, 
	test_for_dec_4/3, test_qsort/1, test_pythag/1, 
	format_num/1]).

test() ->
	Max = 10,
	L1 = test_for_inc(1, Max),
	L2 = test_for_dec(Max, 1),

	L = [23, 11, 24, 82, 77, 20, 93, 100, 201, 110, 123, 66],
	L3 = test_qsort(L),

	N = 30,
	L4 = test_pythag(N),

	io:format(string:concat("~ntest_for_inc: ", format_num(Max)), L1),
	io:format(string:concat("~ntest_for_dec: ", format_num(Max)), L2),
	io:format(string:concat("~ntest_qsort: ", format_num(length(L3))), L3),
	io:format(string:concat("~ntest_pythag: ", format_num(length(L4))), L4).


format_num(0) -> "";
format_num(N) ->
	string:concat("~p ",  format_num(N - 1)).


test_for_inc(I, Max) -> 
	for_ins(I, Max, fun(X) -> X + 1 end).

test_for_dec(I, Min) ->
	for_dec(I, Min, fun(X) -> X *2 end).

test_for_ins_4(I, Max, K) ->
	for_ins(I, Max, fun(X) -> X + 1 end, K).

test_for_dec_4(I, Min, K) ->
	for_dec(I, Min, fun(X) -> X -1 end, K).

test_qsort(L) ->
	qsort(L).

test_pythag(N) ->
	pythag(N).