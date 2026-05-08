(define (domain obfuscated_deceptive_logistics_47)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand_obj cat_obj sneeze_obj st_obj stupendous_obj - object
  )
  (:predicates
    (hand ?o - hand_obj)
    (cats ?o - cat_obj)
    (texture ?o - st_obj)
    (sneeze ?o - sneeze_obj)
    (stupendous ?o - stupendous_obj)
    (spring ?o - st_obj)
    (vase ?h - hand_obj ?o - object)
    (next ?o1 - object ?o2 - st_obj)
    (collect ?o1 - st_obj ?o2 - stupendous_obj)
  )

  (:action paltry
    :parameters (?h - hand_obj ?c - cat_obj ?t - st_obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h - hand_obj ?c - cat_obj ?t - st_obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - st_obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched
    :parameters (?s - sneeze_obj ?t1 - st_obj ?t2 - st_obj ?st - stupendous_obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c - cat_obj ?s1 - st_obj ?s2 - st_obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action tightfisted
    :parameters (?h - hand_obj ?s - sneeze_obj ?t - st_obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)