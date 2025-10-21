(define (domain MysteryBlocksworld6)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

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
  )

  ;; paltry: requires hand ?x, cats ?y, texture ?z, vase ?x ?y, next ?y ?z
  ;; effects: add next ?x ?z, del vase ?x ?y
  (:action act_paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip: requires hand ?x, cats ?y, texture ?z, next ?x ?z, next ?y ?z
  ;; effects: add vase ?x ?y, del next ?x ?z
  (:action act_sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip: requires hand ?x, sneeze ?y, texture ?z, next ?y ?z, next ?x ?z
  ;; effects: add vase ?x ?y, del next ?x ?z
  (:action act_clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched: requires sneeze ?x, texture ?y, texture ?z, stupendous ?w, next ?x ?y,
  ;;            collect ?y ?w, collect ?z ?w
  ;; effects: add next ?x ?z, del next ?x ?y
  (:action act_wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; memory: requires cats ?x, spring ?y, spring ?z, next ?x ?y
  ;; effects: add next ?x ?z, del next ?x ?y
  (:action act_memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; tightfisted: requires hand ?x, sneeze ?y, texture ?z, next ?y ?z, vase ?x ?y
  ;; effects: add next ?x ?z, del vase ?x ?y
  (:action act_tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)