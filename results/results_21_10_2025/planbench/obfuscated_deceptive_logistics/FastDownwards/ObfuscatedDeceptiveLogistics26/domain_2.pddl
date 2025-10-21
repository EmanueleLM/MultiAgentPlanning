(define (domain ObfuscatedDeceptiveLogistics26)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o ?o2)
    (next ?o ?o2)
    (sneeze ?o)
    (collect ?o ?o2)
    (stupendous ?o)
    (spring ?o)
  )

  ;; paltry: needs hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; adds next ?o0 ?o2, deletes vase ?o0 ?o1
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; sip: needs hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; adds vase ?o0 ?o1, deletes next ?o0 ?o2
  (:action sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; clip: needs hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; adds vase ?o0 ?o1, deletes next ?o0 ?o2
  (:action clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; wretched: needs sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; adds next ?o0 ?o2, deletes next ?o0 ?o1
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory: needs cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; adds next ?o0 ?o2, deletes next ?o0 ?o1
  (:action memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; tightfisted: needs hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; adds next ?o0 ?o2, deletes vase ?o0 ?o1
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)