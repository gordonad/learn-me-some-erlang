-module(mafiapp_sup).
-behaviour(supervisor).
-export([start_link/1]).
-export([init/1]).

start_link(Tables) ->
        supervisor:start_link(?MODULE, Tables).

%% This does absolutely nothing, only there to wait for tables.
init(Tables) ->
    mnesia:wait_for_tables(Tables, 5000),
    {ok, {{one_for_one, 1, 1}, []}}.
