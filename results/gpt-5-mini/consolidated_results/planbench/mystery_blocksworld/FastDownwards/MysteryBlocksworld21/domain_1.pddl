; Domain: MysteryBlocksworld21
; Brief notes:
; - I model objects as type obj and agents as type agent. Every action accepts an agent parameter ?ag - agent
;   to indicate who performs it (this preserves multi-agent distinction while not changing public preconditions).
; - Predicates and actions exactly mirror the provided public specifications (preconditions and add/delete effects).
; - This domain is Fast-Downward compatible: it uses :strips, :typing and :negative-preconditions only.

(define (domain MysteryBlocksworld21)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj agent)
  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (vase ?x ?y - obj)
    (collect ?x ?y - obj)
    (next ?x ?y - obj)
  )

  ; paltry: requires hand o0, cats o1, texture o2, vase o0 o1, next o1 o2
  ; effects: add next o0 o2, delete vase o0 o1
  (:action paltry
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ; sip: requires hand o0, cats o1, texture o2, next o0 o2, next o1 o2
  ; effects: add vase o0 o1, delete next o0 o2
  (:action sip
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ; clip: requires hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2
  ; effects: add vase o0 o1, delete next o0 o2
  (:action clip
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ; wretched: requires sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1, collect o1 o3, collect o2 o3
  ; effects: add next o0 o2, delete next o0 o1
  (:action wretched
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ; memory: requires cats o0, spring o1, spring o2, next o0 o1
  ; effects: add next o0 o2, delete next o0 o1
  (:action memory
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ; tightfisted: requires hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1
  ; effects: add next o0 o2, delete vase o0 o1
  (:action tightfisted
    :parameters (?ag - agent ?o0 - obj ?o1 - obj ?o2 - obj)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

)