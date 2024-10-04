{p_for_v(X, Y, V) : x(X), y(Y)} = 1 :- v(V).
:- v(V1), v(V2), V1 < V2, p_for_v(X1, Y1, V1), p_for_v(X2, Y2, V2), X1 = X2, Y1 = Y2.
{v_for_e(X1, Y2, V1, V2); v_for_e(X2, Y1, V1, V2)} = 1 :- e(V1, V2), p_for_v(X1, Y1, V1), p_for_v(X2, Y2, V2), X1 != X2, Y1 != Y2.
segment(X, Y1, X, Y2) :- e(V1, V2), p_for_v(X, Y1, V1), p_for_v(X, Y2, V2).
segment(X1, Y, X2, Y) :- e(V1, V2), p_for_v(X1, Y, V1), p_for_v(X2, Y, V2).
segment(X1, Y1, X3, Y3) :- e(V1, V2), p_for_v(X1, Y1, V1), p_for_v(X2, Y2, V2), v_for_e(X3, Y3, V1, V2).
segment(X2, Y2, X3, Y3) :- e(V1, V2), p_for_v(X1, Y1, V1), p_for_v(X2, Y2, V2), v_for_e(X3, Y3, V1, V2).
:- p_for_v(X, Y, V), v_for_e(X, Y, V1, V2).
:- v_for_e(X, Y, V1, V), v_for_e(X, Y, V3, V), V1 != V3.
:- v_for_e(X, Y, V1, V), v_for_e(X, Y, V, V4), V1 != V4.
:- v_for_e(X, Y, V, V2), v_for_e(X, Y, V3, V), V2 != V3.
:- v_for_e(X, Y, V, V2), v_for_e(X, Y, V3, V4), V2 != V4.
:- v_for_e(X, Y, V1, V2), v_for_e(X, Y, V3, V4), V1 != V3, V1 != V4, V2 != V3, V2 != V4.

% The vertex cannot be put inside a segment
:- p_for_v(X, Y, V), segment(X, Y1, X, Y2), Y1 < Y2, Y > Y1, Y < Y2.
:- p_for_v(X, Y, V), segment(X, Y1, X, Y2), Y2 < Y1, Y > Y2, Y < Y1.
:- p_for_v(X, Y, V), segment(X1, Y, X2, Y), X1 < X2, X > X1, X < X2.
:- p_for_v(X, Y, V), segment(X1, Y, X2, Y), X2 < X1, X > X2, X < X1.

% The virtual vertex cannot be put inside another segment
:- v_for_e(X, Y, V1, V2), segment(X, Y1, X, Y2), Y1 < Y2, Y > Y1, Y < Y2.
:- v_for_e(X, Y, V1, V2), segment(X, Y1, X, Y2), Y2 < Y1, Y > Y2, Y < Y1.
:- v_for_e(X, Y, V1, V2), segment(X1, Y, X2, Y), X1 < X2, X > X1, X < X2.
:- v_for_e(X, Y, V1, V2), segment(X1, Y, X2, Y), X2 < X1, X > X2, X < X1.

% Two horizontal segments
:- segment(X1, Y, X2, Y), segment(X3, Y, X4, Y), X1 < X2, X3 < X4, X3 < X2, X3 > X1.
:- segment(X1, Y, X2, Y), segment(X3, Y, X4, Y), X1 < X2, X4 < X3, X4 < X2, X4 > X1.
:- segment(X1, Y, X2, Y), segment(X3, Y, X4, Y), X2 < X1, X3 < X4, X3 < X1, X3 > X2.
:- segment(X1, Y, X2, Y), segment(X3, Y, X4, Y), X2 < X1, X4 < X3, X4 < X1, X4 > X2.

% Two vertical segments
:- segment(X, Y1, X, Y2), segment(X, Y3, X, Y4), Y1 < Y2, Y3 < Y4, Y3 < Y2, Y3 > Y1.
:- segment(X, Y1, X, Y2), segment(X, Y3, X, Y4), Y1 < Y2, Y4 < Y3, Y4 < Y2, Y4 > Y1.
:- segment(X, Y1, X, Y2), segment(X, Y3, X, Y4), Y2 < Y1, Y3 < Y4, Y3 < Y1, Y3 > Y2.
:- segment(X, Y1, X, Y2), segment(X, Y3, X, Y4), Y2 < Y1, Y4 < Y3, Y4 < Y1, Y4 > Y2.

% The first segment is horizontal, the second one is vertical
:- segment(X1, Y, X2, Y), segment(X, Y1, X, Y2), X1 < X2, Y1 < Y2, X > X1, X < X2, Y > Y1, Y < Y2.
:- segment(X1, Y, X2, Y), segment(X, Y1, X, Y2), X2 < X1, Y1 < Y2, X > X2, X < X1, Y > Y1, Y < Y2.
:- segment(X1, Y, X2, Y), segment(X, Y1, X, Y2), X1 < X2, Y2 < Y1, X > X1, X < X2, Y > Y2, Y < Y1.
:- segment(X1, Y, X2, Y), segment(X, Y1, X, Y2), X2 < X1, Y2 < Y1, X > X2, X < X1, Y > Y2, Y < Y1.

#show p_for_v/3.
#show segment/4.