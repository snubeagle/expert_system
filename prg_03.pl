/**
 * Tanner Madsen, Ryan McCullough
 * */

:- dynamic fact/1.

:- dynamic negfact/1.

is_true(Question) :-
  ( 
    fact(Question) ->
      true;
      negfact(Question) -> false;
      (
        format('~w?~n', [Question]), Answer = read(yes), Answer -> assert(fact(Question)); assert(negfact(Question)), false
      )
  ).

vehicle(truck) :- is_true('has engine'), is_true('has four wheels'), is_true('hauls cargo'), answer('truck').
vehicle(bus) :- is_true('has engine'), is_true('has four wheels'), is_true('hauls people'), answer('bus').
vehicle(car) :- is_true('has engine'), is_true('has four wheels'), answer('car').
vehicle(motorcycle) :- is_true('has engine'), is_true('has two wheels'), answer('motorcycle').
vehicle(snowmobile) :- is_true('has engine'), not(is_true('has wheels')), is_true('goes on snow'), answer('snowmobile').
vehicle(airplane) :- is_true('has engine'), not(is_true('has wheels')), is_true('goes in sky'), answer('airplane').
vehicle(motorboat) :- is_true('has engine'), not(is_true('has wheels')), is_true('goes in water'), is_true('has no sails'), answer('motorboat').
vehicle(sailboat) :- not(is_true('has engine')), not(is_true('has wheels')), is_true('goes in water'), is_true('has sails'), answer('sailboat').
vehicle(snowboard) :- not(is_true('has engine')), not(is_true('has wheels')), is_true('goes on snow'), is_true('is single piece'), answer('snowboard').
vehicle(bicycle) :- not(is_true('has engine')), is_true('has two wheels'), answer('bicycle').
vehicle(unicycle) :- not(is_true('has engine')), is_true('has one wheel'), answer('unicycle').
vehicle(skateboard) :- not(is_true('has engine')), is_true('has four wheels'), answer('skateboard').
vehicle(tank) :- is_true('has engine'), is_true('has treds'), answer('tank').
vehicle(ski) :- not(is_true('has engine')), not(is_true('has wheels')), is_true('goes on snow'), is_true('is two pieces'), answer('ski').
vehicle(semi) :- is_true('has engine'), is_true('has eighteen wheels'), answer('semi').

answer(X) :- 
  format('I think your vehicle is a ~w.~n', [X]),
  write('Did I get it right?'),
  Answer = read(yes),
  (
    Answer ->
      writeln('Nice!');
      writeln('Not my fault! My designers did not give me enough information about vehicles.')
  ).

begin :- 
  writeln('Welcome to the ES about vehicles!
  I am going to ask questions about vehicle features.
  Please answer yes. or no.
  Ready?'),
  Answer = read(yes),
  (
    Answer ->
      retractall(fact(_)),
      retractall(negfact(_)),
      vehicle(X);
      writeln('Bye!')
  ),
  writeln('To try again just type begin.'). 