(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types Obj Stage)

  (:predicates
    (hand ?o - Obj)
    (cats ?o - Obj)
    (texture ?o - Obj)
    (sneeze ?o - Obj)
    (spring ?o - Obj)
    (stupendous ?o - Obj)

    (vase ?a - Obj ?b - Obj)
    (next ?a - Obj ?b - Obj)
    (collect ?a - Obj ?b - Obj)

    ;; explicit discrete time / stage progression
    (stage ?s - Stage)
    (succ ?s1 - Stage ?s2 - Stage)
    (current ?s - Stage)
  )

  ;; All actions require occupying the current stage and advance to its successor.
  ;; This enforces strict, contiguous time progression and prevents oscillation.

  ;; paltry:
  ;; Preconditions: hand o0, cats o1, texture o2, vase(o0,o1), next(o1,o2)
  ;; Effects: add next(o0,o2), remove vase(o0,o1), advance stage
  (:action paltry
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip:
  ;; Preconditions: hand o0, cats o1, texture o2, next(o0,o2), next(o1,o2)
  ;; Effects: add vase(o0,o1), remove next(o0,o2), advance stage
  (:action sip
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip:
  ;; Preconditions: hand o0, sneeze o1, texture o2, next(o1,o2), next(o0,o2)
  ;; Effects: add vase(o0,o1), remove next(o0,o2), advance stage
  (:action clip
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched:
  ;; Preconditions: sneeze o0, texture o1, texture o2, stupendous o3,
  ;;                next(o0,o1), collect(o1,o3), collect(o2,o3)
  ;; Effects: add next(o0,o2), remove next(o0,o1), advance stage
  (:action wretched
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj ?o3 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; memory:
  ;; Preconditions: cats o0, spring o1, spring o2, next(o0,o1)
  ;; Effects: add next(o0,o2), remove next(o0,o1), advance stage
  (:action memory
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted:
  ;; Preconditions: hand o0, sneeze o1, texture o2, next(o1,o2), vase(o0,o1)
  ;; Effects: add next(o0,o2), remove vase(o0,o1), advance stage
  (:action tightfisted
    :parameters (?s - Stage ?s2 - Stage
                 ?o0 - Obj ?o1 - Obj ?o2 - Obj)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)