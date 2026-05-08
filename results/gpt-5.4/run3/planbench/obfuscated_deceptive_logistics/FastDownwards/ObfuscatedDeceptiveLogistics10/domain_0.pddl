(define (domain jackofalltrades_instance)
  (:requirements :strips :typing)

  (:types
    obj
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - obj
  )

  (:predicates
    (hand ?h - obj)
    (cats ?c - obj)
    (sneeze ?s - obj)
    (texture ?t - obj)
    (spring ?sp - obj)
    (stupendous ?u - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (collect ?t - obj ?u - obj)
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
    :parameters (?s - sneeze_obj ?t_from - texture_obj ?t_to - texture_obj ?u - stupendous_obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t_from)
      (texture ?t_to)
      (stupendous ?u)
      (next ?s ?t_from)
      (collect ?t_from ?u)
      (collect ?t_to ?u)
    )
    :effect (and
      (next ?s ?t_to)
      (not (next ?s ?t_from))
    )
  )

  (:action memory
    :parameters (?c - cats_obj ?sp_from - spring_obj ?sp_to - spring_obj)
    :precondition (and
      (cats ?c)
      (spring ?sp_from)
      (spring ?sp_to)
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