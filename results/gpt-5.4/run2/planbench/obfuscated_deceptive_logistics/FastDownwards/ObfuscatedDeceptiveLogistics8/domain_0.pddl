(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)

  (:types
    obj
    hand_t cats_t sneeze_t texture_t spring_t stupendous_t - obj
  )

  (:predicates
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (hand ?x - hand_t)
    (cats ?x - cats_t)
    (sneeze ?x - sneeze_t)
    (spring ?x - spring_t)
    (texture ?x - texture_t)
    (stupendous ?x - stupendous_t)
    (collect ?x - texture_t ?y - stupendous_t)
  )

  (:action paltry
    :parameters (?h - hand_t ?c - cats_t ?t - texture_t)
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
    :parameters (?h - hand_t ?c - cats_t ?t - texture_t)
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
    :parameters (?s - sneeze_t ?t1 - texture_t ?t2 - texture_t ?u - stupendous_t)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?u)
      (next ?s ?t1)
      (collect ?t1 ?u)
      (collect ?t2 ?u)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
    )
  )

  (:action memory
    :parameters (?c - cats_t ?sp1 - spring_t ?sp2 - spring_t)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
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