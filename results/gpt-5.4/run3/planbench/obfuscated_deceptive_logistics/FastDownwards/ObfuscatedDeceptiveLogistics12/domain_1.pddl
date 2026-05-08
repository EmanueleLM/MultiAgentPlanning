(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    thing
    cat hand_obj sneeze_obj texture_obj spring_obj stupendous_obj - thing
  )

  (:predicates
    (cats ?x - thing)
    (hand ?x - thing)
    (sneeze ?x - thing)
    (texture ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
    (collect ?x - thing ?k - thing)
    (next ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cat ?t - texture_obj)
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
    :parameters (?h - hand_obj ?c - cat ?t - texture_obj)
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
    :parameters (?s - sneeze_obj ?from - texture_obj ?to - texture_obj ?k - stupendous_obj)
    :precondition (and
      (sneeze ?s)
      (texture ?from)
      (texture ?to)
      (stupendous ?k)
      (next ?s ?from)
      (collect ?from ?k)
      (collect ?to ?k)
    )
    :effect (and
      (next ?s ?to)
      (not (next ?s ?from))
    )
  )

  (:action memory
    :parameters (?c - cat ?from - spring_obj ?to - spring_obj)
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