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

    ; discrete time progression: a single current time point is maintained and
    ; every action advances from a time to its immediate successor.
    (time-now ?t - time)
    (succ ?t1 - time ?t2 - time)
  )

  ; Paltry: requires hand, cats, texture, vase between hand and cats, and next cats->texture.
  ; Effect: establish next hand->texture and remove vase(hand,cats).
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

  ; Sip: requires hand, cats, texture, next hand->texture and next cats->texture.
  ; Effect: create vase(hand,cats) and remove next hand->texture.
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

  ; Clip: requires hand, sneeze, texture, next sneeze->texture and next hand->texture.
  ; Effect: create vase(hand,sneeze) and remove next hand->texture.
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

  ; Wretched: requires sneeze on o0, textures on o1 and o2, stupendous on o3,
  ; next o0->o1, collect o1->o3 and collect o2->o3.
  ; Effect: set next o0->o2 and remove next o0->o1.
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

  ; Memory: requires cats o0, spring o1, spring o2, and next o0->o1.
  ; Effect: set next o0->o2 and remove next o0->o1.
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

  ; Tightfisted: requires hand o0, sneeze o1, texture o2, next o1->o2, and vase o0,o1.
  ; Effect: set next o0->o2 and remove vase o0,o1.
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