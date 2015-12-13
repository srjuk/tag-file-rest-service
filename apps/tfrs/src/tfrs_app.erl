%%%-------------------------------------------------------------------
%% @doc tfrs public API
%% @end
%%%-------------------------------------------------------------------

-module('tfrs_app').

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    'tfrs_sup':start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

-ifdef(TEST).

simple_test() ->
    ok = application:start(tfrs),
    ?assertNot(undefined == whereis(tfrs_sup)).

-endif.
