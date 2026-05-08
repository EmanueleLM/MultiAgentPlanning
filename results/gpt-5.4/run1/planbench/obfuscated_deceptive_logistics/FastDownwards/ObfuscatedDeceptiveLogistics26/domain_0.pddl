(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
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
    :parameters (?h - obj ?c - obj ?t - obj)
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
    :parameters (?h - obj ?s - obj ?t - obj)
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
    :parameters (?s - obj ?from_t - obj ?to_t - obj ?u - obj)
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
    :parameters (?c - obj ?from_s - obj ?to_s - obj)
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
    :parameters (?h - obj ?s - obj ?t - obj)
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