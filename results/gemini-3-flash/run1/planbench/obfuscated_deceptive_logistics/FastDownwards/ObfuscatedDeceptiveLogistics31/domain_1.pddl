(define (domain obfuscated_deceptive_logistics_31)
  (:requirements :strips :typing)
  (:types
    movable texture stupendous - object
    hand city - movable
    cats sneeze - city
    spring - texture
  )
  (:predicates
    (next ?m - movable ?t - texture)
    (vase ?h - hand ?c - city)
    (collect ?t - texture ?s - stupendous)
  )

  (:action paltry
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h - hand ?c - cats ?t - texture)
    :precondition (and (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c - cats ?s1 - spring ?s2 - spring)
    :precondition (and (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)