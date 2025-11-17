(define (domain objects-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types object time)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (has-next ?o - object)
    (sneeze ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)

    (time-now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ;; paltry: requires vase(?hand,?cats) and next(?cats,?tex)
  ;; creates next(?hand,?tex) — subject ?hand must not already have a next
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
      (not (has-next ?o_hand))
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o_hand ?o_tex)
      (has-next ?o_hand)
      (not (vase ?o_hand ?o_cats))
    )
  )

  ;; sip: requires next on ?o_hand and on ?o_cats (both subjects must have has-next)
  ;; produces vase(?o_hand,?o_cats) and removes the next of ?o_hand (thus clears has-next ?o_hand)
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
      (has-next ?o_hand)
      (has-next ?o_cats)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (vase ?o_hand ?o_cats)
      (not (next ?o_hand ?o_tex))
      (not (has-next ?o_hand))
    )
  )

  ;; clip: requires next on ?o_sneeze and on ?o_hand; removes next for ?o_hand and creates vase
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
      (has-next ?o_sneeze)
      (has-next ?o_hand)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (vase ?o_hand ?o_sneeze)
      (not (next ?o_hand ?o_tex))
      (not (has-next ?o_hand))
    )
  )

  ;; wretched: moves the next link of subject ?o0 from ?o1 to ?o2 (atomic replace)
  ;; requires collect facts and stupendous, ensures subject ?o0 had a next.
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
      (has-next ?o0)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      ;; has-next remains true for ?o0 because next is replaced atomically
      (has-next ?o0)
    )
  )

  ;; memory: moves next from ?o1 to ?o2 for subject ?o0; requires has-next ?o0
  (:action memory
    :parameters (?o0 - object ?o1 - object ?o2 - object ?t - time ?t2 - time)
    :precondition (and
      (time-now ?t)
      (succ ?t ?t2)
      (cats ?o0)
      (spring ?o1)
      (spring ?o2)
      (next ?o0 ?o1)
      (has-next ?o0)
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o0 ?o2)
      (not (next ?o0 ?o1))
      (has-next ?o0)
    )
  )

  ;; tightfisted: requires vase(?o_hand,?o_sneeze) and next(?o_sneeze,?o_tex),
  ;; will create next for ?o_hand (subject must not already have a next)
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
      (has-next ?o_sneeze)
      (not (has-next ?o_hand))
    )
    :effect (and
      (not (time-now ?t))
      (time-now ?t2)
      (next ?o_hand ?o_tex)
      (has-next ?o_hand)
      (not (vase ?o_hand ?o_sneeze))
    )
  )
)