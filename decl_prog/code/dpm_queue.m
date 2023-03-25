%------------------------------------------------------------%
% Declarative programming in Mercury - queue ADT
%------------------------------------------------------------%
:- module dpm_queue.
:- interface.

:- import_module list.

    % Represents a finite sequence of elements.
    %
:- type queue(T).

    % Returns the empty queue.
    %
:- func init = queue(T).

    % put(X, Q0, Q):
    %
    % Q is Q0 with X added to the back of the queue.
    %
:- pred put(T, queue(T), queue(T)).
:- mode put(in, in, out) is det.

    % get(X, Q0, Q):
    %
    % Q is Q0 with X removed from the front of the queue.
    % Fails if Q0 is empty.
    %
:- pred get(T, queue(T), queue(T)).
:- mode get(out, in, out) is semidet.

    % unput(X, Q0, Q):
    %
    % Q is Q0 with X removed from the back of the queue.
    % Fails if Q0 is empty.
    %
:- pred unput(T, queue(T), queue(T)).
:- mode unput(out, in, out) is semidet.

    % unget(X, Q0, Q):
    %
    % Q is Q0 with X added to the front of the queue.
    %
:- pred unget(T, queue(T), queue(T)).
:- mode unget(in, in, out) is det.

    % True iff both queues represent the same sequence
    % of elements.
    %
:- pred eq(queue(T), queue(T)).
:- mode eq(in, in) is semidet.

    % Convert the queue into a list containing the same
    % sequence of elements.
    %
:- func list(queue(T)) = list(T).

%------------------------------------------------------------%
:- implementation.

    % queue(F, B) represents the sequence append(F, reverse(B)).
    %
:- type queue(T)
    --->    queue(
                front :: list(T),
                rev_back :: list(T)
            ).

init = queue([], []).

put(X, queue(F, B), queue(F, [X | B])).

get(X, queue([X | F], B), queue(F, B)).
get(X, queue([], B), queue(F, [])) :-
    [X | F] = reverse(B).

unput(X, queue(F, [X | B]), queue(F, B)).
unput(X, queue(F, []), queue([], B)) :-
    [X | B] = reverse(F).

unget(X, queue(F, B), queue([X | F], B)).

eq(Q1, Q2) :-
    list(Q1) = list(Q2).

list(queue(F, B)) = append(F, reverse(B)).

%------------------------------------------------------------%
:- end_module dpm_queue.
%------------------------------------------------------------%
