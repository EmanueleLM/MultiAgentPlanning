(define (domain depots28_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    ;; unary fluents
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    ;; binary fluents
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; paltry(object_0, object_1, object_2)
  ;; pre: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;; eff: add next o0 o2, del vase o0 o1
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (vase ?o0 ?o1)
      (next ?o1 ?o2)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )

  ;; sip(object_0, object_1, object_2)
  ;; pre: hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;; eff: add vase o0 o1, del next o0 o2
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (cats ?o1)
      (texture ?o2)
      (next ?o0 ?o2)
      (next ?o1 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; clip(object_0, object_1, object_2)
  ;; pre: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;; eff: add vase o0 o1, del next o0 o2
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (next ?o0 ?o2)
    )
    :effect (and
      (vase ?o0 ?o1)
      (not (next ?o0 ?o2))
    )
  )

  ;; wretched(object_0, object_1, object_2, object_3)
  ;; pre: sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ;; eff: add next o0 o2, del next o0 o1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and
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
    )
  )

  ;; memory(object_0, object_1, object_2)
  ;; pre: cats o0, spring o1, spring o2, next o0 o1
  ;; eff: add next o0 o2, del next o0 o1
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  ;; tightfisted(object_0, object_1, object_2)
  ;; pre: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;; eff: add next o0 o2, del vase o0 o1
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and
      (hand ?o0)
      (sneeze ?o1)
      (texture ?o2)
      (next ?o1 ?o2)
      (vase ?o0 ?o1)
    )
    :effect (and
      (next ?o0 ?o2)
      (not (vase ?o0 ?o1))
    )
  )
)