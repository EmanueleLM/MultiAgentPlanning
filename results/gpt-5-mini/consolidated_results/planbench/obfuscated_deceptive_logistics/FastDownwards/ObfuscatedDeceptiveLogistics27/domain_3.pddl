(define (domain obfuscated-deceptive-logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    ;; static object properties (time-invariant)
    (hand ?h - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)

    ;; dynamic world relations (change with actions)
    (vase ?h - obj ?a - obj)
    (next ?a - obj ?b - obj)

    ;; explicit discrete stage control to enforce ordered progression
    (stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)     ;; successor relation between stages (static)
    (at-stage ?s - stage)             ;; single fluent indicating current stage
  )

  ;; Each domain action consumes the current stage and advances to its successor.
  ;; This enforces that actions are applied in a strict sequence and prevents
  ;; post-hoc oscillation: once on successor stage, earlier stages cannot
  ;; be revisited (no action can re-add at-stage for a previous stage).
  ;; Actions apply the original preconditions/effects on vase/next predicates.

  (:action paltry
    :parameters (?h - obj ?a - obj ?b - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (vase ?h ?a)
      (next ?a ?b)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)
      (next ?h ?b)
      (not (vase ?h ?a))
    )
  )

  (:action sip
    :parameters (?h - obj ?a - obj ?b - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?a)
      (texture ?b)
      (next ?h ?b)
      (next ?a ?b)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)
      (vase ?h ?a)
      (not (next ?h ?b))
    )
  )

  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)
      (vase ?h ?sneeze)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?sneeze - obj ?t1 - obj ?t2 - obj ?u - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?sneeze)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
      (next ?sneeze ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)
      (next ?sneeze ?t2)
      (not (next ?sneeze ?t1))
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?s - stage ?s2st - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (at-stage ?s)
      (succ ?s ?s2st)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2st)
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (vase ?h ?sneeze)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-stage ?s))
      (at-stage ?s2)
      (next ?h ?t)
      (not (vase ?h ?sneeze))
    )
  )
)