:- module test_queue.
:- interface.

:- import_module io.

:- pred main(io::di, io::uo) is det.

:- implementation.

:- import_module list.
:- import_module string.

:- import_module dpm_queue.

main(!IO) :-
    test(test1, !IO).

:- type tq == queue(int).

:- pred test(pred(int, tq, tq), io, io).
:- mode test(in(pred(out, in, out) is semidet), di, uo) is det.

test(P, !IO) :-
    ( if P(Z, init, Q) then
        io.format("Z = %d\n", [i(Z)], !IO),
        io.format("Q = %s\n", [s(string(Q))], !IO)
    else
        io.write_string("failed\n\n", !IO)
    ).

:- pred test1(int, tq, tq).
:- mode test1(out, in, out) is semidet.

test1(Z, !Q) :-
    put(1, !Q),
    get(Z, !Q).

