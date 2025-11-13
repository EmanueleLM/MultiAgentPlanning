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

    ;; explicit discrete stage modeling for ordered progression
    (stage_reached ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Each action consumes the current stage and advances to its successor.
  ;; This enforces an explicit discrete ordering: every executed action moves the global stage forward,
  ;; and only the current stage is considered reachable.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (stage_reached ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (stage_reached ?s))
      (stage_reached ?s2)
    )
  )
)