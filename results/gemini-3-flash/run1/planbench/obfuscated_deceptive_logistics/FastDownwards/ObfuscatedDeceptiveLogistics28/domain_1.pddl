(define (domain obfuscated_deceptive_logistics_28)
  (:requirements :strips)
  (:predicates
    (hand ?v)
    (cats ?c)
    (texture ?t)
    (sneeze ?s)
    (spring ?sp)
    (stupendous ?st)
    (vase ?v ?h)
    (next ?obj1 ?obj2)
    (collect ?t ?st)
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
    :parameters (?s ?t1 ?t2 ?r)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?r) (next ?s ?t1) (collect ?t1 ?r) (collect ?t2 ?r))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  (:action memory
    :parameters (?c ?s1 ?s2)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action tightfisted
    :parameters (?v ?s ?t)
    :precondition (and (hand ?v) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?v ?s))
    :effect (and (next ?v ?t) (not (vase ?v ?s)))
  )
)