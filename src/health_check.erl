-module(health_check). 
-export([init/2]).

init(Req, State) ->
  Body = <<"PONG">>,
  Rep = cowboy_req:reply(200, #{}, Body, Req),
  {ok, Rep, State}. 
