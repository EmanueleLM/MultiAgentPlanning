(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?x - obj)
    (collect ?a - obj ?b - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: requires a vase relationship and a successor for y (y->z),
  ;; and requires that x currently has some successor u which will be replaced by z.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?u - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (next ?x ?u)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (next ?x ?u))
    )
  )

  ;; sip: consumes an existing next relation from x->z (and requires y->z),
  ;; produces vase x y and removes x->z (swap/replace semantics handled elsewhere).
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

  ;; clip: similar to sip but requires sneeze on y; removes x->z and creates vase x y
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

  ;; wretched: swaps x's successor from b to c; requires collects for b and c into d.
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

  ;; memory: swaps successor of x from y to z (requires x->y and y,z are springs)
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; tightfisted: requires vase x y and next y z, replaces x's current successor u with z.
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?u - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (next ?x ?u)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (next ?x ?u))
    )
  )
)