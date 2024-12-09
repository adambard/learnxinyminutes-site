:- object(python).

    :- public(say_creator/0).
    say_creator :-
        write('Created by: Guido van Rossum'),nl.

:- end_object.
?- logtalk_load('langs.lgt').
?- python::say_creator.
Creator: Guido van Rossum
   true.
:- object(animal).

    :- public(run/0).
    run :-
        write('Animal is running'),nl.

:- end_object.

:- object(dog, extends(animal)).

    :- public(sleep/0).
    sleep :-
        write('Dog is sleeping'),nl.
:- end_object.
:- object(animal).

    :- public(run/0).
    run :-
        write('Animal is running'),nl.

:- end_object.

:- object(dog, extends(animal)).

    :- public(run/0).
    run :-
        write('Dog is running'),nl,
        ^^run.

    :- public(sleep/0).
    sleep :-
        write('Dog is sleeping'),nl.

    :- public(run_and_sleep/0).
    run_and_sleep :-
        ::run,
        ::sleep.
:- end_object.
Dog is running
Animal is running
Dog is sleeping
    run_and_sleep :-
        self(Self),
        Self::run,
        Self::sleep.
?- create_object(foo, [extends(bar)], [public(foo/1)], [foo(1), foo(2)]).

%%%%

:- object(foo, extends(bar)).

    :- dynamic.

    :- public(foo/1).
    foo(1).
    foo(2).

:- end_object.
:- object(ruby(_Creator)).

    :- public(say_creator/0).
    say_creator :-
        write('Created by: '),
        parameter(1, Creator),
        write(Creator),nl.

:- end_object.
:- protocol(langp).

    :- public(say_creator/0).

:- end_protocol.

:- object(python, implements(langp)).

    say_creator :-
        write('Created by: Guido van Rossum'),nl.

:- end_object.
:- category(reverse_creator(_Creator_)).

    :- uses(list, [reverse/2]).

    :- public(reverse_creator/1).
    reverse_creator(Reversed) :-
        reverse(_Creator_, Reversed).

:- end_category.

:- object(ruby(CreatorParam), implements(langp), imports(reverse_creator(CreatorParam))).

    say_creator :-
        write('Created by: '),
        parameter(1, Creator),
        write(Creator),nl.

:- end_object.
?- logtalk_load(types(loader)).
    ....
?- logtalk_load('langs.lgt').
    ....
?- ruby("Matz")::reverse_creator(X).
    X = "ztaM".
:- initialization((
    logtalk_load(sets(loader)),
    logtalk_load(meta(loader)),
    logtalk_load(app)
)).
?- meta::map([X, Y]>>(Y is 2*X), [1,2,3], Ys).
   Ys = [2,4,6].
times2(X, Y) :- Y is 2 * X.
