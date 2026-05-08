(define (domain obfuscated_deceptive_logistics_6)
  (:requirements :strips)
  (:predicates
    (hand ?obj)
    (cats ?obj)
    (texture ?obj)
    (vase ?v ?t)
    (next ?obj ?loc)
    (sneeze ?obj)
    (stupendous ?obj)
    (collect ?loc ?city)
    (spring ?loc)
  )

  (:action paltry
    :parameters (?v ?t ?l)
    :precondition (and (hand ?v) (cats ?t) (texture ?l) (vase ?v ?t) (next ?t ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?t)))
  )

  (:action sip
    :parameters (?v ?t ?l)
    :precondition (and (hand ?v) (cats ?t) (texture ?l) (next ?v ?l) (next ?t ?l))
    :effect (and (vase ?v ?t) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v ?t ?l)
    :precondition (and (hand ?v) (sneeze ?t) (texture ?l) (next ?t ?l) (next ?v ?l))
    :effect (and (vase ?v ?t) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?t ?l1 ?l2 ?c)
    :precondition (and (sneeze ?t) (texture ?l1) (texture ?l2) (stupendous ?c) (next ?t ?l1) (collect ?l1 ?c) (collect ?l2 ?c))
    :effect (and (next ?t ?l2) (not (next ?t ?l1)))
  )

  (:action memory
    :parameters (?t ?l1 ?l2)
    :precondition (and (cats ?t) (spring ?l1) (spring ?l2) (next ?t ?l1))
    :effect (and (next ?t ?l2) (not (next ?t ?l1)))
  )

  (:action tightfisted
    :parameters (?v ?t ?l)
    :precondition (and (hand ?v) (sneeze ?t) (texture ?l) (next ?t ?l) (vase ?v ?t))
    :effect (and (next ?v ?l) (not (vase ?v ?t)))
  )
)