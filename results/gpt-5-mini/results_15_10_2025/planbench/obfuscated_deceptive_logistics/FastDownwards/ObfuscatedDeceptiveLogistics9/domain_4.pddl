(define (domain ObfuscatedDeceptiveLogistics9)
  (:requirements :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x - object)
    (next ?x - object ?y - object)
    (sneeze ?x - object)
    (spring ?x - object)
    (collect ?x - object ?y - object)
    (stupendous ?x - object)
  )

  (:action manipulator_A_paltry
    :parameters (?a - object ?b - object ?c - object ?d - object)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?d)
      (next ?b ?d)
    )
    :effect (and
      (next ?a ?b)
      (not (vase ?d))
    )
  )

  (:action manipulator_A_sip
    :parameters (?h - object ?c - object ?t - object ?x - object ?y - object)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?x ?y)
      (next ?y ?x)
    )
    :effect (and
      (vase ?x)
      (not (next ?x ?y))
    )
  )

  (:action manipulator_A_clip
    :parameters (?h - object ?s - object ?t - object ?x - object ?y - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?x ?y)
      (next ?y ?x)
    )
    :effect (and
      (vase ?x)
      (not (next ?x ?y))
    )
  )

  (:action manipulator_B_wretched
    :parameters (?s - object ?t - object ?u - object ?x - object ?y - object ?z - object ?c - object ?d - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t)
      (stupendous ?u)
      (next ?x ?y)
      (next ?y ?z)
      (collect ?c ?d)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?y ?z))
    )
  )

  (:action manipulator_B_memory
    :parameters (?c - object ?s - object ?x - object ?y - object)
    :precondition (and
      (cats ?c)
      (spring ?s)
      (next ?x ?y)
    )
    :effect (and
      (next ?y ?x)
      (not (next ?x ?y))
    )
  )

  (:action manipulator_B_tightfisted
    :parameters (?h - object ?s - object ?t - object ?x - object ?y - object ?v - object)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?x ?y)
      (vase ?v)
    )
    :effect (and
      (next ?y ?v)
      (not (vase ?v))
    )
  )
)