(define (domain orchestrated-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj world)

  (:predicates
    (hand ?o - obj ?w - world)
    (cats ?o - obj ?w - world)
    (texture ?o - obj ?w - world)
    (vase ?x - obj ?y - obj ?w - world)
    (next ?a - obj ?b - obj ?w - world)
    (collect ?a - obj ?b - obj ?w - world)
    (sneeze ?o - obj ?w - world)
    (spring ?o - obj ?w - world)
    (stupendous ?o - obj ?w - world)
  )

  ;; paltry: pre: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ;;         add: next o0 o2 ; del: vase o0 o1
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?w - world)
    :precondition (and
      (hand ?o0 ?w)
      (cats ?o1 ?w)
      (texture ?o2 ?w)
      (vase ?o0 ?o1 ?w)
      (next ?o1 ?o2 ?w)
    )
    :effect (and
      (next ?o0 ?o2 ?w)
      (not (vase ?o0 ?o1 ?w))
    )
  )

  ;; sip: pre: hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ;;      add: vase o0 o1 ; del: next o0 o2
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?w - world)
    :precondition (and
      (hand ?o0 ?w)
      (cats ?o1 ?w)
      (texture ?o2 ?w)
      (next ?o0 ?o2 ?w)
      (next ?o1 ?o2 ?w)
    )
    :effect (and
      (vase ?o0 ?o1 ?w)
      (not (next ?o0 ?o2 ?w))
    )
  )

  ;; clip: pre: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ;;       add: vase o0 o1 ; del: next o0 o2
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?w - world)
    :precondition (and
      (hand ?o0 ?w)
      (sneeze ?o1 ?w)
      (texture ?o2 ?w)
      (next ?o1 ?o2 ?w)
      (next ?o0 ?o2 ?w)
    )
    :effect (and
      (vase ?o0 ?o1 ?w)
      (not (next ?o0 ?o2 ?w))
    )
  )

  ;; wretched: pre: sneeze o0, texture o1, texture o2, stupendous o3,
  ;;           next o0 o1, collect o1 o3, collect o2 o3
  ;;           add: next o0 o2 ; del: next o0 o1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?w - world)
    :precondition (and
      (sneeze ?o0 ?w)
      (texture ?o1 ?w)
      (texture ?o2 ?w)
      (stupendous ?o3 ?w)
      (next ?o0 ?o1 ?w)
      (collect ?o1 ?o3 ?w)
      (collect ?o2 ?o3 ?w)
    )
    :effect (and
      (next ?o0 ?o2 ?w)
      (not (next ?o0 ?o1 ?w))
    )
  )

  ;; memory: pre: cats o0, spring o1, spring o2, next o0 o1
  ;;         add: next o0 o2 ; del: next o0 o1
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?w - world)
    :precondition (and
      (cats ?o0 ?w)
      (spring ?o1 ?w)
      (spring ?o2 ?w)
      (next ?o0 ?o1 ?w)
    )
    :effect (and
      (next ?o0 ?o2 ?w)
      (not (next ?o0 ?o1 ?w))
    )
  )

  ;; tightfisted: pre: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ;;              add: next o0 o2 ; del: vase o0 o1
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?w - world)
    :precondition (and
      (hand ?o0 ?w)
      (sneeze ?o1 ?w)
      (texture ?o2 ?w)
      (next ?o1 ?o2 ?w)
      (vase ?o0 ?o1 ?w)
    )
    :effect (and
      (next ?o0 ?o2 ?w)
      (not (vase ?o0 ?o1 ?w))
    )
  )
)