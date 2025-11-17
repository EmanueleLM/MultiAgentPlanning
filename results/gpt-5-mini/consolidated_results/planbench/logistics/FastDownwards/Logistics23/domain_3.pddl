(define (domain Logistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (at-stage ?x - obj ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ; paltry: requires hand(X), cats(Y), texture(Z), vase(X,Y), next(Y,Z)
  ; stage model: require X and Y are at stage S and Z at successor S2; move X to S2
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (at-stage ?x ?s)
      (at-stage ?y ?s)
      (at-stage ?z ?s2)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?s))
      (at-stage ?x ?s2)
    )
  )

  ; sip: requires hand(X), cats(Y), texture(Z), next(X,Z), next(Y,Z)
  ; stage model: X and Y at S, Z at S2; move X to S2, delete next(X,Z), add vase(X,Y)
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (at-stage ?x ?s)
      (at-stage ?y ?s)
      (at-stage ?z ?s2)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?s))
      (at-stage ?x ?s2)
    )
  )

  ; clip: requires hand(X), sneeze(Y), texture(Z), next(Y,Z), next(X,Z)
  ; stage model: X and Y at S, Z at S2; move X to S2, delete next(X,Z), add vase(X,Y)
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (at-stage ?x ?s)
      (at-stage ?y ?s)
      (at-stage ?z ?s2)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?s))
      (at-stage ?x ?s2)
    )
  )

  ; wretched: requires sneeze(A), texture(B), texture(C), stupendous(D),
  ;           next(A,B), collect(B,D), collect(C,D)
  ; stage model: A at S, B at S1, C at S2 where succ S S1 and succ S1 S2
  ; move A from S to S1, delete next(A,B), add next(A,C)
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj
                 ?s - stage ?s1 - stage ?s2 - stage)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
      (at-stage ?a ?s)
      (at-stage ?b ?s1)
      (at-stage ?c ?s2)
      (succ ?s ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-stage ?a ?s))
      (at-stage ?a ?s1)
    )
  )

  ; memory: requires cats(A), spring(B), spring(C), next(A,B)
  ; stage model: A at S, B at S1, C at S2 with succ S S1 and succ S1 S2
  ; move A to S1, delete next(A,B), add next(A,C)
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj
                 ?s - stage ?s1 - stage ?s2 - stage)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
      (at-stage ?a ?s)
      (at-stage ?b ?s1)
      (at-stage ?c ?s2)
      (succ ?s ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
      (not (at-stage ?a ?s))
      (at-stage ?a ?s1)
    )
  )

  ; tightfisted: requires hand(X), sneeze(Y), texture(Z), next(Y,Z), vase(X,Y)
  ; stage model: X and Y at S, Z at S2 with succ S S2; move X to S2, delete vase(X,Y), add next(X,Z)
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (at-stage ?x ?s)
      (at-stage ?y ?s)
      (at-stage ?z ?s2)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?s))
      (at-stage ?x ?s2)
    )
  )
)