(define (domain ObfuscatedDeceptiveLogistics18)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)
    (spring ?o - obj)
    ;; explicit discrete-stage progression to enforce ordered action execution
    (succ ?s1 - stage ?s2 - stage)
    (stage-now ?s - stage)
  )

  ;; paltry: needs hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;; add next o0 o2, del vase o0 o1
  ;; plus stage progression: consumes current stage ?t and advances to ?t2 where (succ ?t ?t2)
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

  ;; sip: needs hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;; add vase o0 o1, del next o0 o2
  ;; plus stage progression
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

  ;; clip: needs hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;; add vase o0 o1, del next o0 o2
  ;; plus stage progression
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

  ;; wretched: needs sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ;; add next o0 o2, del next o0 o1
  ;; plus stage progression
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
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

  ;; memory: needs cats o0, spring o1, spring o2, next o0 o1
  ;; add next o0 o2, del next o0 o1
  ;; plus stage progression
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

  ;; tightfisted: needs hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;; add next o0 o2, del vase o0 o1
  ;; plus stage progression
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
      (stage-now ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
      (not (stage-now ?t))
      (stage-now ?t2)
    )
  )

)