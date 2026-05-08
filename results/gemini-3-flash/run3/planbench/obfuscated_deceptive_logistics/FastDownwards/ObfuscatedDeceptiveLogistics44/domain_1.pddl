(define (domain obfuscated_deceptive_logistics_44)
  (:requirements :strips :typing)
  (:types
    locatable_obj point_obj stupendous_obj - object
    hand_obj loc_obj - locatable_obj
    cats_obj sneeze_obj - loc_obj
  )

  (:predicates
    (hand ?h - hand_obj)
    (cats ?c - cats_obj)
    (sneeze ?s - sneeze_obj)
    (texture ?p - point_obj)
    (spring ?p - point_obj)
    (stupendous ?st - stupendous_obj)
    (vase ?h - hand_obj ?l - loc_obj)
    (next ?l - locatable_obj ?p - point_obj)
    (collect ?p - point_obj ?st - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cats_obj ?p - point_obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?p) (vase ?h ?c) (next ?c ?p))
    :effect (and (next ?h ?p) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h - hand_obj ?c - cats_obj ?p - point_obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?p) (next ?h ?p) (next ?c ?p))
    :effect (and (vase ?h ?c) (not (next ?h ?p)))
  )

  (:action clip
    :parameters (?h - hand_obj ?s - sneeze_obj ?p - point_obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?p) (next ?s ?p) (next ?h ?p))
    :effect (and (vase ?h ?s) (not (next ?h ?p)))
  )

  (:action wretched
    :parameters (?s - sneeze_obj ?p1 - point_obj ?p2 - point_obj ?st - stupendous_obj)
    :precondition (and (sneeze ?s) (texture ?p1) (texture ?p2) (stupendous ?st) (next ?s ?p1) (collect ?p1 ?st) (collect ?p2 ?st))
    :effect (and (next ?s ?p2) (not (next ?s ?p1)))
  )

  (:action memory
    :parameters (?c - cats_obj ?p1 - point_obj ?p2 - point_obj)
    :precondition (and (cats ?c) (spring ?p1) (spring ?p2) (next ?c ?p1))
    :effect (and (next ?c ?p2) (not (next ?c ?p1)))
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?p - point_obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?p) (next ?s ?p) (vase ?h ?s))
    :effect (and (next ?h ?p) (not (vase ?h ?s)))
  )
)