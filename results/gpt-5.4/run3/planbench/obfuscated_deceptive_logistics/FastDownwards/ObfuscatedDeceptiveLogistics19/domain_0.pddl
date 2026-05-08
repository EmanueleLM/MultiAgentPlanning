(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    object
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - object
  )

  (:predicates
    (next ?x - object ?y - object)
    (vase ?h - hand_obj ?x - object)
    (collect ?t - texture_obj ?u - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cats_obj ?t - texture_obj)
    :precondition (and
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
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  (:action wretched
    :parameters (?s - sneeze_obj ?t1 - texture_obj ?t2 - texture_obj ?u - stupendous_obj)
    :precondition (and
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cats_obj ?sp1 - spring_obj ?sp2 - spring_obj)
    :precondition (and
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
    :precondition (and
      (vase ?h ?s)
      (next ?s ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)