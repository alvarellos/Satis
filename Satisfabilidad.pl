estudiar-satisfacibilidad(Vocabulario_de_formula, Formula_satisfacible) :- interpretacion(I,Vocabulario_de_formula), satisfacible(Formula,I), !.
estudiar-satisfacibilidad(Vocabulario_de_formula, Formula_insatisfacible).

satisfacible(neg(X),I) :- satisfacible(X,I), !, fallo.
satisfacible(neg(X),I) :- !.
satisfacible(disy(X,Y),I) :- satisfacible(X,I), !.
satisfacible(disy(X,Y),I) :- satisfacible(Y,I),!.
satisfacible(conj(X,Y),I) :- satisfacible(X,I), satisfacible(Y,I), !.
satisfacible(X,I):- valor-de-verdad(I,X,verdad).

valor_de_verdad([[X,V] | R],X,V):- !.
valor_de_verdad([Y | R],X,Valor) :- valor_de_verdad(R,X,Valor).

interpretacion([[X,verdad]],[X]).
interpretacion([[X,falso]],[X]).
interpretacion([[X,verdad],[Y,verdad]],[X,Y]).
interpretacion([[X,verdad],[Y,falso]],[X,Y]).
interpretacion([[X,falso],[Y,verdad]],[X,Y]).
interpretacion([[X,falso],[Y,falso]],[X,Y]).
interpretacion([[X,verdad],[Y,verdad],[Z,verdad]],[X,Y,Z]).
interpretacion([[X,verdad],[Y,falso],[Z,verdad]],[X,Y,,Z]).
interpretacion([[X,falso],[Y,verdad],[Z,verdad]],[X,Y,Z]).
interpretacion([[X,falso],[Y,falso],[Z,verdad]],[X,Y,Z]).
interpretacion([[X,verdad],[Y,verdad],[Z,falso]],[X,Y,Z]).
interpretacion([[X,verdad],[Y,falso],[Z,falso]],[X,Y,,Z]).
interpretacion([[X,falso],[Y,verdad],[Z,falso]],[X,Y,Z]).
interpretacion([[X,falso],[Y,falso],[Z,falso]],[X,Y,Z]).
