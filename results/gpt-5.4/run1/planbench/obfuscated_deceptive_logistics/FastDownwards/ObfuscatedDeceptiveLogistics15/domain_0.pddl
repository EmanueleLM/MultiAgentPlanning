(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types object)

  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (sneeze ?x - object)
    (texture ?x - object)
    (spring ?x - object)
    (stupendous ?x - object)
    (collect ?t - object ?s - object)
    (next ?from - object ?to - object)
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
    :parameters (?s - object ?t_old - object ?t_new - object ?u - object)
    :precondition (and
      (sneeze ?s)
      (texture ?t_old)
      (texture ?t_new)
      (stupendous ?u)
      (next ?s ?t_old)
      (collect ?t_old ?u)
      (collect ?t_new ?u)
    )
    :effect (and
      (next ?s ?t_new)
      (not (next ?s ?t_old))
    )
  )

  (:action memory
    :parameters (?c - object ?sp_old - object ?sp_new - object)
    :precondition (and
      (cats ?c)
      (spring ?sp_old)
      (spring ?sp_new)
      (next ?c ?sp_old)
    )
    :effect (and
      (next ?c ?sp_new)
      (not (next ?c ?sp_old))
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