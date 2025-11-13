(define (domain ObfuscatedDeceptiveLogistics29)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: pre: hand x0, cats x1, texture x2, vase x0 x1, next x1 x2
  ;; effects: add next x0 x2, del vase x0 x1
  (:action paltry
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and (hand ?x0) (cats ?x1) (texture ?x2) (vase ?x0 ?x1) (next ?x1 ?x2))
    :effect (and (next ?x0 ?x2) (not (vase ?x0 ?x1)))
  )

  ;; sip: pre: hand x0, cats x1, texture x2, next x0 x2, next x1 x2
  ;; effects: add vase x0 x1, del next x0 x2
  (:action sip
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and (hand ?x0) (cats ?x1) (texture ?x2) (next ?x0 ?x2) (next ?x1 ?x2))
    :effect (and (vase ?x0 ?x1) (not (next ?x0 ?x2)))
  )

  ;; clip: pre: hand x0, sneeze x1, texture x2, next x1 x2, next x0 x2
  ;; effects: add vase x0 x1, del next x0 x2
  (:action clip
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and (hand ?x0) (sneeze ?x1) (texture ?x2) (next ?x1 ?x2) (next ?x0 ?x2))
    :effect (and (vase ?x0 ?x1) (not (next ?x0 ?x2)))
  )

  ;; wretched: pre: sneeze x0, texture x1, texture x2, stupendous x3, next x0 x1, collect x1 x3, collect x2 x3
  ;; effects: add next x0 x2, del next x0 x1
  (:action wretched
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj ?x3 - obj)
    :precondition (and (sneeze ?x0) (texture ?x1) (texture ?x2) (stupendous ?x3) (next ?x0 ?x1) (collect ?x1 ?x3) (collect ?x2 ?x3))
    :effect (and (next ?x0 ?x2) (not (next ?x0 ?x1)))
  )

  ;; memory: pre: cats x0, spring x1, spring x2, next x0 x1
  ;; effects: add next x0 x2, del next x0 x1
  (:action memory
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and (cats ?x0) (spring ?x1) (spring ?x2) (next ?x0 ?x1))
    :effect (and (next ?x0 ?x2) (not (next ?x0 ?x1)))
  )

  ;; tightfisted: pre: hand x0, sneeze x1, texture x2, next x1 x2, vase x0 x1
  ;; effects: add next x0 x2, del vase x0 x1
  (:action tightfisted
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and (hand ?x0) (sneeze ?x1) (texture ?x2) (next ?x1 ?x2) (vase ?x0 ?x1))
    :effect (and (next ?x0 ?x2) (not (vase ?x0 ?x1)))
  )
)