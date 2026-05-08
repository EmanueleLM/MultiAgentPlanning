(define (domain obfuscated_deceptive_logistics_15)
  (:requirements :strips :typing)
  (:types 
    hand cats sneeze stupendous texture - object
    spring - texture
  )

  (:predicates
    (vase ?h - hand ?loc - object)
    (next ?obj1 - object ?obj2 - object)
    (collect ?t - texture ?s - stupendous)
  )

  (:action paltry
    :parameters (?v - hand ?c - cats ?t - texture)
    :precondition (and (vase ?v ?c) (next ?c ?t))
    :effect (and (next ?v ?t) (not (vase ?v ?c)))
  )

  (:action sip
    :parameters (?v - hand ?c - cats ?t - texture)
    :precondition (and (next ?v ?t) (next ?c ?t))
    :effect (and (vase ?v ?c) (not (next ?v ?t)))
  )

  (:action clip
    :parameters (?v - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (next ?v ?t))
    :effect (and (vase ?v ?s) (not (next ?v ?t)))
  )

  (:action wretched
    :parameters (?s - sneeze ?t1 - texture ?t2 - texture ?st - stupendous)
    :precondition (and (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c - cats ?sp1 - spring ?sp2 - spring)
    :precondition (and (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted
    :parameters (?v - hand ?s - sneeze ?t - texture)
    :precondition (and (next ?s ?t) (vase ?v ?s))
    :effect (and (next ?v ?t) (not (vase ?v ?s)))
  )
)