-module(demo_controller).
-export([hello/1, echo/1, slow/1]).

hello(_Req) ->
    {json, #{message => <<"Hello!">>}}.

echo(#{body := Body}) ->
    {json, #{echo => Body}};
echo(_Req) ->
    {json, #{echo => <<>>}}.

slow(_Req) ->
    Delay = 100 + rand:uniform(401) - 1,
    timer:sleep(Delay),
    {json, #{message => <<"Done!">>, delay_ms => Delay}}.
