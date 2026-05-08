(define (domain obfuscated_deceptive_logistics_21)
  (:requirements :strips :typing)
  (:types
    hand cat sneeze stupendous texture - object
    spring - texture
  )

  (:predicates
    (hand ?h - hand)
    (cats ?c - cat)
    (sneeze ?s - sneeze)
    (texture ?t - texture)
    (stupendous ?st - stupendous)
    (spring ?sp - spring)
    (next ?obj - object ?loc - texture)
    (vase ?h - hand ?v - object)
    (collect ?t - texture ?st - stupendous)
  )

  (:action paltry
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  (:action sip
    :parameters (?h - hand ?c - cat ?t - texture)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  (:action clip
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c - cat ?sp1 - spring ?sp2 - spring)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted
    :parameters (?h - hand ?s - sneeze ?t - texture)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)