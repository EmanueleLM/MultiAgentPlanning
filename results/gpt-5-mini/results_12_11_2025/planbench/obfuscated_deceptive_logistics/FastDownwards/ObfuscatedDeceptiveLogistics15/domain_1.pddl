(define (domain ObfuscatedDeceptiveLogistics15)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?o ?p)
    (next ?o ?p)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
    (collect ?o ?p)
  )

  ;; paltry requires hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, next ?o1 ?o2
  ;; effects: add next ?o0 ?o2, delete vase ?o0 ?o1
  (:action paltry
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; sip requires hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, next ?o1 ?o2
  ;; effects: add vase ?o0 ?o1, delete next ?o0 ?o2
  (:action sip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; clip requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, next ?o0 ?o2
  ;; effects: add vase ?o0 ?o1, delete next ?o0 ?o2
  (:action clip
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; wretched requires sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, collect ?o2 ?o3
  ;; effects: add next ?o0 ?o2, delete next ?o0 ?o1
  (:action wretched
    :parameters (?o0 ?o1 ?o2 ?o3)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory requires cats ?o0, spring ?o1, spring ?o2, next ?o0 ?o1
  ;; effects: add next ?o0 ?o2, delete next ?o0 ?o1
  (:action memory
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; tightfisted requires hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, vase ?o0 ?o1
  ;; effects: add next ?o0 ?o2, delete vase ?o0 ?o1
  (:action tightfisted
    :parameters (?o0 ?o1 ?o2)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)