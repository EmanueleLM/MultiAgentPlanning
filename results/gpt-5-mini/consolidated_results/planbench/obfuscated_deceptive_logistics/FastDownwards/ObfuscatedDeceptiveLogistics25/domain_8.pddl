(define (domain ObfuscatedDeceptiveLogistics25)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (collect ?a - obj ?b - obj)
    (next ?a - obj ?b - obj)
    (vase ?a - obj ?b - obj)
    ;; explicit discrete time progression to enforce contiguous stage occupancy
    (curr ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  ;; paltry: requires hand O0, cats O1, texture O2, vase O0 O1, next O1 O2
  ;; effects: add next O0 O2, del vase O0 O1, advance stage
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; sip: requires hand O0, cats O1, texture O2, next O0 O2, next O1 O2
  ;; effects: add vase O0 O1, del next O0 O2, advance stage
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; clip: requires hand O0, sneeze O1, texture O2, next O1 O2, next O0 O2
  ;; effects: add vase O0 O1, del next O0 O2, advance stage
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; wretched: requires sneeze O0, texture O1, texture O2, stupendous O3,
  ;;            next O0 O1, collect O1 O3, collect O2 O3
  ;; effects: add next O0 O2, del next O0 O1, advance stage
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; memory: requires cats O0, spring O1, spring O2, next O0 O1
  ;; effects: add next O0 O2, del next O0 O1, advance stage
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ;; tightfisted: requires hand O0, sneeze O1, texture O2, next O1 O2, vase O0 O1
  ;; effects: add next O0 O2, del vase O0 O1, advance stage
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (curr ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (curr ?t))
      (curr ?t2)
    )
  )
)