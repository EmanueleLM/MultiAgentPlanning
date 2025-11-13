(define (domain obfuscated_deceptive_logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)

    ;; explicit discrete stage modeling (ordered objects)
    (stage_reached ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All object-manipulation actions require the model to be in a valid stage.
  ;; This encodes an explicit stage constraint that the planner must respect.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?stage - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (stage_reached ?stage)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?stage - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (stage_reached ?stage)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?stage - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (stage_reached ?stage)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj ?stage - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (stage_reached ?stage)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?stage - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (stage_reached ?stage)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?stage - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (stage_reached ?stage)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)