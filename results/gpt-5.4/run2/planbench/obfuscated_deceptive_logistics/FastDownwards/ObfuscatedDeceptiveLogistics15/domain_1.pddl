(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    obj
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - obj
  )

  (:predicates
    (hand ?x - hand_obj)
    (cats ?x - cats_obj)
    (sneeze ?x - sneeze_obj)
    (texture ?x - texture_obj)
    (spring ?x - spring_obj)
    (stupendous ?x - stupendous_obj)
    (next ?x - obj ?y - obj)
    (vase ?x - hand_obj ?y - obj)
    (collect ?x - texture_obj ?y - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cats_obj ?t - texture_obj)
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
    :parameters (?h - hand_obj ?c - cats_obj ?t - texture_obj)
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
    :parameters (?s - sneeze_obj ?from_t - texture_obj ?to_t - texture_obj ?st - stupendous_obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from_t)
      (texture ?to_t)
      (stupendous ?st)
      (next ?s ?from_t)
      (collect ?from_t ?st)
      (collect ?to_t ?st)
    )
    :effect (and
      (next ?s ?to_t)
      (not (next ?s ?from_t))
    )
  )

  (:action memory
    :parameters (?c - cats_obj ?from_s - spring_obj ?to_s - spring_obj)
    :precondition (and
      (cats ?c)
      (spring ?from_s)
      (spring ?to_s)
      (next ?c ?from_s)
    )
    :effect (and
      (next ?c ?to_s)
      (not (next ?c ?from_s))
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