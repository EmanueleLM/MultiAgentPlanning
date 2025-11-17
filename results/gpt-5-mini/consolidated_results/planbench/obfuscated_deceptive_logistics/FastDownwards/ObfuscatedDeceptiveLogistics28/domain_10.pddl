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
    ;; stage/time bookkeeping to enforce strict sequential execution
    (stage_reached ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions require the plan to be executed stepwise through stages.
  ;; Each action consumes the current stage token and produces the next,
  ;; enforcing a single action per stage and contiguous occupancy.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?cur - stage ?nxt - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (stage_reached ?cur)
      (succ ?cur ?nxt)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (stage_reached ?cur))
      (stage_reached ?nxt)
    )
  )
)