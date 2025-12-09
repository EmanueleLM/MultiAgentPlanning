(define (domain ObfuscatedDeceptiveLogistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (stage-available ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  ;; paltry: requires hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; effect: add next ?o0 ?o2, delete vase ?o0 ?o1, consume current stage and advance
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  ;; sip: requires hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; effect: add vase ?o0 ?o1, delete next ?o0 ?o2, advance stage
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  ;; clip: requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; effect: add vase ?o0 ?o1, delete next ?o0 ?o2, advance stage
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  ;; wretched: requires sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3,
  ;; next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; effect: add next ?o0 ?o2, delete next ?o0 ?o1, advance stage
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  ;; memory: requires cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; effect: add next ?o0 ?o2, delete next ?o0 ?o1, advance stage
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )

  ;; tightfisted: requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; effect: add next ?o0 ?o2, delete vase ?o0 ?o1, advance stage
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (stage-available ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-available ?s))
      (stage-available ?s2)
    )
  )
)