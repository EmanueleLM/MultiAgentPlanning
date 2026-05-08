(define (domain jackofalltrades_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    object
    hand_obj cats_obj sneeze_obj texture_obj spring_obj stupendous_obj - object
  )

  (:predicates
    (hand ?h - object)
    (cats ?c - object)
    (sneeze ?s - object)
    (texture ?t - object)
    (spring ?s - object)
    (stupendous ?u - object)
    (collect ?t - object ?u - object)
    (next ?x - object ?y - object)
    (vase ?h - object ?a - object)
  )

  (:action paltry
    :parameters (?h - object ?c - object ?t - object)
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
    :parameters (?h - object ?c - object ?t - object)
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
    :parameters (?h - object ?s - object ?t - object)
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
    :parameters (?s - object ?t_from - object ?t_to - object ?u - object)
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
    :parameters (?c - object ?sp_from - object ?sp_to - object)
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
    :parameters (?h - object ?s - object ?t - object)
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