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
    ;; explicit ordered stages (present in domain and problem; actions do not invent stages)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires vase(X,Y) and next(Y,Z); produces next(X,Z) and removes vase(X,Y)
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: requires next(X,Z) and next(Y,Z); produces vase(X,Y) and removes next(X,Z)
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; clip: requires next(Y,Z) and next(X,Z); produces vase(X,Y) and removes next(X,Z)
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; wretched: requires next(A,B) and collect(B,D) and collect(C,D); produces next(A,C) and removes next(A,B)
  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; memory: requires next(A,B) and two springs; produces next(A,C) and removes next(A,B)
  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  ;; tightfisted: requires next(Y,Z) and vase(X,Y); produces next(X,Z) and removes vase(X,Y)
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)