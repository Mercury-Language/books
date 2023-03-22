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

    % put(Z, Q0, Q):
    %
    % Q is Q0 with Z added to the back of the queue.
    %
:- pred put(T, queue(T), queue(T)).
:- mode put(in, in, out) is det.

    % get(Z, Q0, Q):
    %
    % Q is Q0 with Z removed from the front of the queue.
    % Fails if Q0 is empty.
    %
:- pred get(T, queue(T), queue(T)).
:- mode get(out, in, out) is semidet.

    % unput(Z, Q0, Q):
    %
    % Q is Q0 with Z removed from the back of the queue.
    % Fails if Q0 is empty.
    %
:- pred unput(T, queue(T), queue(T)).
:- mode unput(out, in, out) is semidet.

    % unget(Z, Q0, Q):
    %
    % Q is Q0 with Z added to the front of the queue.
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

    % q(Y, X) represents the sequence append(X, reverse(Y)).
    %
:- type queue(T)
    --->    q(
                back :: list(T),
                front :: list(T)
            ).

init = q([], []).

put(Z, q(Y, X), q([Z | Y], X)).

get(Z, q(Y, [Z | X]), q(Y, X)).
get(Z, q(Y, []), q([], X)) :- [Z | X] = reverse(Y).

unput(Z, q([Z | Y], X), q(Y, X)).
unput(Z, q([], X), q(Y, [])) :- [Z | Y] = reverse(X).

unget(Z, q(Y, X), q(Y, [Z | X])).

eq(Q1, Q2) :-
    list(Q1) = list(Q2).

list(q(Y, X)) = append(X, reverse(Y)).

%------------------------------------------------------------%
:- end_module dpm_queue.
%------------------------------------------------------------%
