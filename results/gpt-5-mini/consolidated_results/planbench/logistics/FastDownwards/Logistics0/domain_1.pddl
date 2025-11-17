(define (domain orchestrator-next-link)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage act)

  (:predicates
    ; world predicates (objects)
    (next ?from - obj ?to - obj)
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (stupendous ?o - obj)

    ; explicit stage/ordering predicates
    (current-stage ?s - stage)               ; which stage is currently active (exactly one)
    (succ-stage ?s - stage ?t - stage)       ; successor relation between stages
    (allowed-at ?act - act ?s - stage)       ; which actions are allowed at which stage
  )

  ; Each action requires that it is allowed at the current stage and advances the stage to its successor.
  ; The stage token is moved from ?s to ?s2 by every action execution; this enforces contiguous stage occupancy
  ; and a strict ordering of actions when the problem gives allowed-at facts.

  (:action paltry
    :parameters (?h - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?x)
      (texture ?y)
      (vase ?h ?x)
      (next ?x ?y)
      (current-stage ?s)
      (succ-stage ?s ?s2)
      (allowed-at paltry ?s)
    )
    :effect (and
      (next ?h ?y)                ; add next h->y
      (not (vase ?h ?x))          ; delete vase h x
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action sip
    :parameters (?h - obj ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?x)
      (texture ?y)
      (next ?h ?y)
      (next ?x ?y)
      (current-stage ?s)
      (succ-stage ?s ?s2)
      (allowed-at sip ?s)
    )
    :effect (and
      (vase ?h ?x)                ; add vase h x
      (not (next ?h ?y))          ; delete next h y
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action clip
    :parameters (?h - obj ?snee - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?y)
      (next ?snee ?y)
      (next ?h ?y)
      (current-stage ?s)
      (succ-stage ?s ?s2)
      (allowed-at clip ?s)
    )
    :effect (and
      (vase ?h ?snee)             ; add vase h sneeze
      (not (next ?h ?y))          ; delete next h y
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action wretched
    :parameters (?snee - obj ?t1 - obj ?t2 - obj ?st - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?snee)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?snee ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current-stage ?s)
      (succ-stage ?s ?s2)
      (allowed-at wretched ?s)
    )
    :effect (and
      (next ?snee ?t2)            ; add next sneeze -> t2
      (not (next ?snee ?t1))      ; delete previous next sneeze -> t1
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?s - stage ?s2st - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current-stage ?s)
      (succ-stage ?s ?s2st)
      (allowed-at memory ?s)
    )
    :effect (and
      (next ?c ?s2)               ; add next c -> s2
      (not (next ?c ?s1))         ; delete next c -> s1
      (not (current-stage ?s))
      (current-stage ?s2st)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?snee - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?snee)
      (texture ?t)
      (next ?snee ?t)
      (vase ?h ?snee)
      (current-stage ?s)
      (succ-stage ?s ?s2)
      (allowed-at tightfisted ?s)
    )
    :effect (and
      (next ?h ?t)                ; add next h -> t
      (not (vase ?h ?snee))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)