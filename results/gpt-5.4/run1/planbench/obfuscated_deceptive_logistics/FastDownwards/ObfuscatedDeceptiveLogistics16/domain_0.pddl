(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    object
    hand_obj cat_obj sneeze_obj texture_obj spring_obj stupendous_obj - object
  )

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (texture ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cat_obj ?t - texture_obj)
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
    :parameters (?h - hand_obj ?c - cat_obj ?t - texture_obj)
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
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
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
    :parameters (?s - sneeze_obj ?from_t - texture_obj ?to_t - texture_obj ?k - stupendous_obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from_t)
      (texture ?to_t)
      (stupendous ?k)
      (next ?s ?from_t)
      (collect ?from_t ?k)
      (collect ?to_t ?k)
    )
    :effect (and
      (next ?s ?to_t)
      (not (next ?s ?from_t))
    )
  )

  (:action memory
    :parameters (?c - cat_obj ?from_sp - spring_obj ?to_sp - spring_obj)
    :precondition (and
      (cats ?c)
      (spring ?from_sp)
      (spring ?to_sp)
      (next ?c ?from_sp)
    )
    :effect (and
      (next ?c ?to_sp)
      (not (next ?c ?from_sp))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
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