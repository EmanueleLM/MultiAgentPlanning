(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:constants
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 object_14 object_15 - object
  )
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?a ?b - object)
    (vase ?a ?b - object)
    (next ?a ?b - object)
  )

  ;; paltry: requires that ?x has no existing next relation (functionality invariant enforced
  ;; by explicit negative preconditions over all objects), plus the stated preconditions.
  (:action paltry
    :parameters (?x ?y ?z - object)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      ;; enforce that there is no next(?x, any) by enumerating all objects
      (not (next ?x object_0)) (not (next ?x object_1)) (not (next ?x object_2))
      (not (next ?x object_3)) (not (next ?x object_4)) (not (next ?x object_5))
      (not (next ?x object_6)) (not (next ?x object_7)) (not (next ?x object_8))
      (not (next ?x object_9)) (not (next ?x object_10)) (not (next ?x object_11))
      (not (next ?x object_12)) (not (next ?x object_13)) (not (next ?x object_14))
      (not (next ?x object_15))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  (:action sip
    :parameters (?x ?y ?z - object)
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

  (:action clip
    :parameters (?x ?y ?z - object)
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

  (:action wretched
    :parameters (?x ?y ?z ?u - object)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?u)
      (next ?x ?y)
      (collect ?y ?u)
      (collect ?z ?u)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action memory
    :parameters (?x ?y ?z - object)
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

  ;; tightfisted: adds next(?x,?z) but does not delete prior next in original spec,
  ;; so enforce functionality by requiring no existing next(?x,any) (enumerated).
  (:action tightfisted
    :parameters (?x ?y ?z - object)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      ;; enforce that there is no next(?x, any)
      (not (next ?x object_0)) (not (next ?x object_1)) (not (next ?x object_2))
      (not (next ?x object_3)) (not (next ?x object_4)) (not (next ?x object_5))
      (not (next ?x object_6)) (not (next ?x object_7)) (not (next ?x object_8))
      (not (next ?x object_9)) (not (next ?x object_10)) (not (next ?x object_11))
      (not (next ?x object_12)) (not (next ?x object_13)) (not (next ?x object_14))
      (not (next ?x object_15))
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)