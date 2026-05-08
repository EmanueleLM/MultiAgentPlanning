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
    :parameters (?s - obj ?t_from - obj ?t_to - obj ?u - obj)
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
    :parameters (?c - obj ?sp_from - obj ?sp_to - obj)
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