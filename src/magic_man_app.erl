%%%-------------------------------------------------------------------
%% @doc magic_man public API
%% @end
%%%-------------------------------------------------------------------

-module(magic_man_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    
  Dispatch = cowboy_router:compile([ {'_', [ 
    {"/store/:id", file_store, []}
  ]}                                     
                                   ]),
  {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
    {env, [{dispatch, Dispatch}]}
  ]),
  magic_man_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================