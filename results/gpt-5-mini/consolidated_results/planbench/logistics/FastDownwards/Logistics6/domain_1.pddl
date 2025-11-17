(define (domain Logistics6)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (stupendous ?o - object)
    (spring ?o - object)
    ;; explicit discrete-stage control to enforce ordered execution
    (current-step ?s - step)
    (step-succ ?s1 - step ?s2 - step)
  )

  ;; paltry: requires hand, cats, texture, vase, next(o1,o2). Adds next(o0,o2), deletes vase(o0,o1)
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; sip: requires hand, cats, texture, next(o0,o2), next(o1,o2). Adds vase(o0,o1), deletes next(o0,o2)
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; clip: requires hand, sneeze, texture, next(o1,o2), next(o0,o2). Adds vase(o0,o1), deletes next(o0,o2)
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; wretched: requires sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3.
  ;; Adds next o0 o2, deletes next o0 o1.
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?s - step ?ns - step)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; memory: requires cats o0, spring o1, spring o2, next o0 o1. Adds next o0 o2, deletes next o0 o1.
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )

  ;; tightfisted: requires hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1.
  ;; Adds next o0 o2, deletes vase o0 o1.
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?s - step ?ns - step)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (current-step ?s)
      (step-succ ?s ?ns)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (current-step ?s))
      (current-step ?ns)
    )
  )
)