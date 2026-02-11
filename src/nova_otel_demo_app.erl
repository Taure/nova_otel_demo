-module(nova_otel_demo_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    opentelemetry_nova:setup(#{prometheus => #{port => 9464}}),
    nova_otel_demo_sup:start_link().

stop(_State) -> ok.
