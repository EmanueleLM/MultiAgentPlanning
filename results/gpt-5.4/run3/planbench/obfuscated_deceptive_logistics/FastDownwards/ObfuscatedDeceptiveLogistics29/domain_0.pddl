(define (domain jackofalltrades_instance)
  (:requirements :strips :typing)

  (:types
    object
    hand_t cat_t sneeze_t texture_t spring_t stupendous_t - object
  )

  (:predicates
    (hand ?h - hand_t)
    (cats ?c - cat_t)
    (sneeze ?s - sneeze_t)
    (texture ?t - texture_t)
    (spring ?s - spring_t)
    (stupendous ?u - stupendous_t)
    (collect ?t - texture_t ?u - stupendous_t)
    (next ?x - object ?y - object)
    (vase ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?h - hand_t ?c - cat_t ?t - texture_t)
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
    :parameters (?h - hand_t ?c - cat_t ?t - texture_t)
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
    :parameters (?s - sneeze_t ?from - texture_t ?to - texture_t ?u - stupendous_t)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?u)
      (next ?s ?from)
      (collect ?from ?u)
      (collect ?to ?u)
    )
    :effect (and
      (next ?s ?to)
      (not (next ?s ?from))
    )
  )

  (:action memory
    :parameters (?c - cat_t ?from - spring_t ?to - spring_t)
    :precondition (and
      (cats ?c)
      (spring ?from)
      (spring ?to)
      (next ?c ?from)
    )
    :effect (and
      (next ?c ?to)
      (not (next ?c ?from))
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