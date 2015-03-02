%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 二月 2015 14:49
%%%-------------------------------------------------------------------
-module(mysql).
-author("Administrator").

%% API
-export([start/0, fectch/0, fectch/2, delete_all/1]).

start() ->
	application:start(p1_mysql),
	p1_mysql:start_link(0, "localhost", "root", "123456", "test"),
	p1_mysql:connect(1, "localhost", undefined, "root", "123456", "test", true).

fectch() ->
	fectch(0, "select * from people").
fectch(Id, Query) ->
	p1_mysql:fetch(Id, Query).

delete_all(Table) ->
	fectch(1, "delete from " ++ Table).
