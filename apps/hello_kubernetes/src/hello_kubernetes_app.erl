%%%-------------------------------------------------------------------
%% @doc hello_kubernetes public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_kubernetes_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    {ok, Pid} = hello_kubernetes_sup:start_link(),
    hello_kubernetes_cowboy:start(),
    {ok, Pid}.

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
