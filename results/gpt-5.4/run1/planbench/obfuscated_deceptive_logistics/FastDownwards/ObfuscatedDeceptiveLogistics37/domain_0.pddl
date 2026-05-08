(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    object
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - object
  )

  (:predicates
    (next ?x - object ?y - object)
    (vase ?h - hand_obj ?x - object)
    (collect ?t - texture_obj ?g - stupendous_obj)
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
    :parameters (?s - sneeze_obj ?t_from - texture_obj ?t_to - texture_obj ?g - stupendous_obj)
    :precondition (and
      (next ?s ?t_from)
      (collect ?t_from ?g)
      (collect ?t_to ?g)
    )
    :effect (and
      (next ?s ?t_to)
      (not (next ?s ?t_from))
    )
  )

  (:action memory
    :parameters (?c - cats_obj ?sp_from - spring_obj ?sp_to - spring_obj)
    :precondition (and
      (next ?c ?sp_from)
    )
    :effect (and
      (next ?c ?sp_to)
      (not (next ?c ?sp_from))
    )
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - texture_obj)
    :precondition (and
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)