(define (domain weird_actions)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
  )
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (collect ?x - obj ?y - obj)
    (vase ?x - obj)
    (next ?x - obj ?y - obj)
  )
  ; Actions paltry, sip, clip, wretched, memory, tightfisted must be added here
  ; with the exact preconditions and effects from the public domain_spec.
)