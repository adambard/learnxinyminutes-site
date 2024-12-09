:- object(list).

	:- public(member/2).
	member(Head, [Head| _]).
	member(Head, [_| Tail]) :-
		member(Head, Tail).

:- end_object.
?- {list}.
yes
?- list::member(X, [1,2,3]).
X = 1 ;
X = 2 ;
X = 3
yes
:- object(scopes).

	:- private(bar/0).
	bar.

	local.

:- end_object.
?- {scopes}.
yes

?- catch(scopes::bar, Error, true).
Error = error(
	permission_error(access, private_predicate, bar/0),
	logtalk(scopes::bar, user)
)
yes

?- catch(scopes::local, Error, true).
Error = error(
	existence_error(predicate_declaration, local/0),
	logtalk(scopes::local, user)
)
yes
?- catch(scopes::unknown, Error, true).
Error = error(
	existence_error(predicate_declaration, unknown/0),
	logtalk(scopes::unknown, user)
)
yes
:- protocol(listp).

	:- public(member/2).

:- end_protocol.

:- object(list,
	implements(listp)).

	member(Head, [Head| _]).
	member(Head, [_| Tail]) :-
		member(Head, Tail).

:- end_object.
:- object(stack,
	implements(private::listp)).

:- end_object.
% clyde, our prototypical elephant
:- object(clyde).

	:- public(color/1).
	color(grey).

	:- public(number_of_legs/1).
	number_of_legs(4).

:- end_object.

% fred, another elephant, is like clyde, except that he's white
:- object(fred,
	extends(clyde)).

	color(white).

:- end_object.
?- fred::number_of_legs(N).
N = 4
yes

?- fred::color(C).
C = white
yes
:- object(foo).

	:- public(bar/0).

:- end_object.
?- {foo}.
yes

?- foo::bar.
no

?- catch(foo::baz, Error, true).
Error = error(
	existence_error(predicate_declaration, baz/0),
	logtalk(foo::baz, user)
)
yes
% a simple, generic, metaclass defining a new/2 predicate for its instances
:- object(metaclass,
	instantiates(metaclass)).

	:- public(new/2).
	new(Instance, Clauses) :-
		self(Class),
		create_object(Instance, [instantiates(Class)], [], Clauses).

:- end_object.

% a simple class defining age/1 and name/1 predicate for its instances
:- object(person,
	instantiates(metaclass)).

	:- public([
		age/1, name/1
	]).

	% a default value for age/1
	age(42).

:- end_object.

% a static instance of the class person
:- object(john,
	instantiates(person)).

	name(john).
	age(12).

:- end_object.
?- person::new(Instance, [name(paulo)]).
Instance = o1
yes

?- o1::name(Name).
Name = paulo
yes

?- o1::age(Age).
Age = 42
yes

?- john::age(Age).
Age = 12
yes
% a protocol describing engine characteristics
:- protocol(carenginep).

	:- public([
		reference/1,
		capacity/1,
		cylinders/1,
		horsepower_rpm/2,
		bore_stroke/2,
		fuel/1
	]).

:- end_protocol.

% a typical engine defined as a category
:- category(classic,
	implements(carenginep)).

	reference('M180.940').
	capacity(2195).
	cylinders(6).
	horsepower_rpm(94, 4800).
	bore_stroke(80, 72.8).
	fuel(gasoline).

:- end_category.

% a souped up version of the previous engine
:- category(sport,
	extends(classic)).

	reference('M180.941').
	horsepower_rpm(HP, RPM) :-
		^^horsepower_rpm(ClassicHP, ClassicRPM),	% "super" call
		HP is truncate(ClassicHP*1.23),
		RPM is truncate(ClassicRPM*0.762).

:- end_category.

% with engines (and other components), we may start "assembling" some cars
:- object(sedan,
	imports(classic)).

:- end_object.

:- object(coupe,
	imports(sport)).

:- end_object.
?- sedan::current_predicate(Predicate).
Predicate = reference/1 ;
Predicate = capacity/1 ;
Predicate = cylinders/1 ;
Predicate = horsepower_rpm/2 ;
Predicate = bore_stroke/2 ;
Predicate = fuel/1
yes
:- object(buggy).

	:- public(p/0).
	p :- write(foo).

:- end_object.
?- {buggy}.
yes

?- buggy::p.
foo
yes
:- category(patch,
	complements(buggy)).

	% fixed p/0 def
	p :- write(bar).

:- end_category.
?- set_logtalk_flag(complements, allow).
yes

?- {patch}.
yes

?- buggy::p.
bar
yes
:- object(circle(_Radius, _Color)).

	:- public([
		area/1, perimeter/1
	]).

	area(Area) :-
		parameter(1, Radius),
		Area is pi*Radius*Radius.

	perimeter(Perimeter) :-
		parameter(1, Radius),
		Perimeter is 2*pi*Radius.

:- end_object.
?- circle(1.23, blue)::area(Area).
Area = 4.75291
yes
circle(1.23, blue).
circle(3.71, yellow).
circle(0.39, green).
circle(5.74, black).
circle(8.32, cyan).
?- findall(Area, {circle(_, _)}::area(Area), Areas).
Areas = [4.75291, 43.2412, 0.477836, 103.508, 217.468]
yes
:- object(tracer,
	implements(monitoring)).    % built-in protocol for event handlers

	:- initialization(define_events(_, _, _, _, tracer)).

	before(Object, Message, Sender) :-
		write('call: '), writeq(Object), write(' <-- '), writeq(Message),
		write(' from '), writeq(Sender), nl.

	after(Object, Message, Sender) :-
		write('exit: '), writeq(Object), write(' <-- '), writeq(Message),
		write(' from '), writeq(Sender), nl.

:- end_object.
?- set_logtalk_flag(events, allow).
yes

?- list::member(X, [1,2,3]).

call: list <-- member(X, [1,2,3]) from user
exit: list <-- member(1, [1,2,3]) from user
X = 1 ;
exit: list <-- member(2, [1,2,3]) from user
X = 2 ;
exit: list <-- member(3, [1,2,3]) from user
X = 3
yes
?- {meta(loader)}.
yes

?- meta::map([X,Y]>>(Y is 2*X), [1,2,3], Ys).
Ys = [2,4,6]
yes
?- meta::map([X]>>([Y]>>(Y is 2*X)), [1,2,3], Ys).
Ys = [2,4,6]
yes
:- object(source).

	:- public(bar/1).
	bar(X) :- foo(X).

	foo(a). foo(b). foo(c).

:- end_object.
:- object(my_macros,
	implements(expanding)).    % built-in protocol for expanding predicates

	term_expansion(foo(Char), baz(Code)) :-
		char_code(Char, Code). % standard built-in predicate

	goal_expansion(foo(X), baz(X)).

:- end_object.
?- logtalk_load(my_macros), logtalk_load(source, [hook(my_macros)]).
yes

?- source::bar(X).
X = 97 ;
X = 98 ;
X = 99
true
