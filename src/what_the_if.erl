- module(what_the_if) .
- export([ heh_fine / 0 , oh_god / 1 , help_me / 1 , insert / 2 ]) .


heh_fine () ->
if 1 =:= 1 ->
works
end ,
if 1 =:= 2 ; 1 =:= 1 ->
works
end ,
if 1 =:= 2 , 1 =:= 1 ->
fails
end .


oh_god (N) ->
if N =:= 2 ->might_succeed ;
true ->always_does %% this is Erlang's if's 'else!'
 end .


%% note, this one would be better as a pattern match in function heads!
%% I'm doing it this way for the sake of the example.
 help_me (Animal) ->
 Talk = if Animal == cat ->"meow" ;
 Animal == beef ->"mooo" ;
 Animal == dog ->"bark" ;
 Animal == tree ->"bark" ;
 true ->"grrrrrr...."
 end ,
 {Animal , "says " ++ Talk ++ "!"} .


insert (X , [ ]) ->[ X ] ;
insert (X , Set) ->
case lists : member (X , Set) of
true ->Set ;
false ->[ X | Set ]
end .

beach (Temperature) ->
case Temperature of
{celsius , N} when N >= 20 , N =< 45 ->
'favorable' ;
{kelvin , N} when N >= 293 , N =< 318 ->
'scientifically favorable' ;
{fahrenheit , N} when N >= 68 , N =< 113 ->
'favorable in the US' ;
_ ->
'avoid beach'
end .



