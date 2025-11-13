(define (domain ObfuscatedDeceptiveLogistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (collect ?a - object ?b - object)
    (stupendous ?o - object)
    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: requires hand(o0), cats(o1), texture(o2), vase(o0,o1), next(o1,o2)
  ;; Effects: add next(o0,o2), delete vase(o0,o1). Enforce discrete time step progression.
  (:action paltry
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )

  ;; sip: requires hand(o0), cats(o1), texture(o2), next(o0,o2), next(o1,o2)
  ;; Effects: add vase(o0,o1), delete next(o0,o2). Enforce time progression.
  (:action sip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )

  ;; clip: requires hand(o0), sneeze(o1), texture(o2), next(o1,o2), next(o0,o2)
  ;; Effects: add vase(o0,o1), delete next(o0,o2). Enforce time progression.
  (:action clip
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )

  ;; wretched: requires sneeze(o0), texture(o1), texture(o2), stupendous(o3),
  ;; next(o0,o1), collect(o1,o3), collect(o2,o3)
  ;; Effects: add next(o0,o2), delete next(o0,o1). Enforce time progression.
  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )

  ;; memory: requires cats(o0), spring(o1), spring(o2), next(o0,o1)
  ;; Effects: add next(o0,o2), delete next(o0,o1). Enforce time progression.
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )

  ;; tightfisted: requires hand(o0), sneeze(o1), texture(o2), next(o1,o2), vase(o0,o1)
  ;; Effects: add next(o0,o2), delete vase(o0,o1). Enforce time progression.
  (:action tightfisted
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t1 - stage ?t2 - stage)
    :precondition (and
      (at-stage ?t1)
      (succ ?t1 ?t2)
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (at-stage ?t2)
      (not (at-stage ?t1))
    )
  )
)