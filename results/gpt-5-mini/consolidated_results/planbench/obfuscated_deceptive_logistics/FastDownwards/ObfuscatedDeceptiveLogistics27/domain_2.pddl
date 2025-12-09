(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (time ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  ;; All actions advance the global time token from a stage to its successor.
  ;; This enforces explicit discrete-stage progression and prevents oscillation
  ;; by requiring every action to consume the current time and produce the next.

  (:action orchestrator-paltry
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  (:action orchestrator-sip
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  (:action orchestrator-clip
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  (:action orchestrator-wretched
    :parameters (?sneeze - obj ?tfrom - obj ?tto - obj ?collector - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (sneeze ?sneeze)
      (texture ?tfrom)
      (texture ?tto)
      (stupendous ?collector)
      (next ?sneeze ?tfrom)
      (collect ?tfrom ?collector)
      (collect ?tto ?collector)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (next ?sneeze ?tto)
      (not (next ?sneeze ?tfrom))
    )
  )

  (:action orchestrator-memory
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action orchestrator-tightfisted
    :parameters (?a - obj ?b - obj ?c - obj ?s - stage ?s2 - stage)
    :precondition (and
      (time ?s)
      (succ ?s ?s2)
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (not (time ?s))
      (time ?s2)
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

)