(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types thing)

  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (sneeze ?x - thing)
    (texture ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
    (collect ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
  )

  (:action paltry
    :parameters (?h - thing ?c - thing ?t - thing)
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
    :parameters (?h - thing ?c - thing ?t - thing)
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
    :parameters (?h - thing ?s - thing ?t - thing)
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
    :parameters (?s - thing ?from_t - thing ?to_t - thing ?u - thing)
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
    :parameters (?c - thing ?from_s - thing ?to_s - thing)
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
    :parameters (?h - thing ?s - thing ?t - thing)
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