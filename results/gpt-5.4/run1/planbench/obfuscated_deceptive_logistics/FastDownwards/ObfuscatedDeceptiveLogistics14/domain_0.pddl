(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types object)

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
    :parameters (?s - object ?from_t - object ?to_t - object ?u - object)
    :precondition (and
      (sneeze ?s)
      (texture ?from_t)
      (texture ?to_t)
      (stupendous ?u)
      (next ?s ?from_t)
      (collect ?from_t ?u)
      (collect ?to_t ?u)
    )
    :effect (and
      (next ?s ?to_t)
      (not (next ?s ?from_t))
    )
  )

  (:action memory
    :parameters (?c - object ?from_s - object ?to_s - object)
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