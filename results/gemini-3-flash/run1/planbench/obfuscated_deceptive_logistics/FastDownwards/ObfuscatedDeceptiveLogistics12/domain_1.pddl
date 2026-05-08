(define (domain obfuscated_deceptive_logistics_12)
  (:requirements :strips)
  (:predicates
    (hand ?v)
    (cats ?c)
    (sneeze ?s)
    (texture ?t)
    (spring ?sp)
    (stupendous ?st)
    (vase ?v ?carrier)
    (next ?obj ?loc)
    (collect ?loc ?st)
  )

  (:action paltry
    :parameters (?v ?c ?t)
    :precondition (and (hand ?v) (cats ?c) (texture ?t) (vase ?v ?c) (next ?c ?t))
    :effect (and (next ?v ?t) (not (vase ?v ?c)))
  )

  (:action sip
    :parameters (?v ?c ?t)
    :precondition (and (hand ?v) (cats ?c) (texture ?t) (next ?v ?t) (next ?c ?t))
    :effect (and (vase ?v ?c) (not (next ?v ?t)))
  )

  (:action clip
    :parameters (?v ?s ?t)
    :precondition (and (hand ?v) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?v ?t))
    :effect (and (vase ?v ?s) (not (next ?v ?t)))
  )

  (:action wretched
    :parameters (?s ?t1 ?t2 ?st)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c ?sp1 ?sp2)
    :precondition (and (cats ?c) (spring ?sp1) (spring ?sp2) (next ?c ?sp1))
    :effect (and (next ?c ?sp2) (not (next ?c ?sp1)))
  )

  (:action tightfisted
    :parameters (?v ?s ?t)
    :precondition (and (hand ?v) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?v ?s))
    :effect (and (next ?v ?t) (not (vase ?v ?s)))
  )
)