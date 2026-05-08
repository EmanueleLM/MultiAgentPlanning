(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    object
    hand_t cats_t sneeze_t texture_t spring_t stupendous_t - object
  )

  (:predicates
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (texture ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?h - hand_t ?c - cats_t ?t - texture_t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  (:action sip
    :parameters (?h - hand_t ?c - cats_t ?t - texture_t)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  (:action clip
    :parameters (?h - hand_t ?s - sneeze_t ?t - texture_t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze_t ?old - texture_t ?new - texture_t ?u - stupendous_t)
    :precondition (and
      (sneeze ?s)
      (texture ?old)
      (texture ?new)
      (stupendous ?u)
      (next ?s ?old)
      (collect ?old ?u)
      (collect ?new ?u)
    )
    :effect (and
      (next ?s ?new)
      (not (next ?s ?old))
    )
  )

  (:action memory
    :parameters (?c - cats_t ?old - spring_t ?new - spring_t)
    :precondition (and
      (cats ?c)
      (spring ?old)
      (spring ?new)
      (next ?c ?old)
    )
    :effect (and
      (next ?c ?new)
      (not (next ?c ?old))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_t ?s - sneeze_t ?t - texture_t)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)