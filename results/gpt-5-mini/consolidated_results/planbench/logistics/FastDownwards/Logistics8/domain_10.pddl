(define (domain objects-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)

    (time-now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  (:action paltry
    :parameters (?o_hand - object ?o_cats - object ?o_tex - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (hand ?o_hand)
      (cats ?o_cats)
      (texture ?o_tex)
      (vase ?o_hand ?o_cats)
      (next ?o_cats ?o_tex)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o_hand ?o_tex)
      (not (vase ?o_hand ?o_cats))
    )
  )

  (:action sip
    :parameters (?o_hand - object ?o_cats - object ?o_tex - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (hand ?o_hand)
      (cats ?o_cats)
      (texture ?o_tex)
      (next ?o_hand ?o_tex)
      (next ?o_cats ?o_tex)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (vase ?o_hand ?o_cats)
      (not (next ?o_hand ?o_tex))
    )
  )

  (:action clip
    :parameters (?o_hand - object ?o_sneeze - object ?o_tex - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (hand ?o_hand)
      (sneeze ?o_sneeze)
      (texture ?o_tex)
      (next ?o_sneeze ?o_tex)
      (next ?o_hand ?o_tex)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (vase ?o_hand ?o_sneeze)
      (not (next ?o_hand ?o_tex))
    )
  )

  (:action wretched
    :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (sneeze ?o0)
      (texture ?o1)
      (texture ?o2)
      (stupendous ?o3)
      (next ?o0 ?o1)
      (collect ?o1 ?o3)
      (collect ?o2 ?o3)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
    )
  )

  (:action tightfisted
    :parameters (?o_hand - object ?o_sneeze - object ?o_tex - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (hand ?o_hand)
      (sneeze ?o_sneeze)
      (texture ?o_tex)
      (next ?o_sneeze ?o_tex)
      (vase ?o_hand ?o_sneeze)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o_hand ?o_tex)
      (not (vase ?o_hand ?o_sneeze))
    )
  )
)