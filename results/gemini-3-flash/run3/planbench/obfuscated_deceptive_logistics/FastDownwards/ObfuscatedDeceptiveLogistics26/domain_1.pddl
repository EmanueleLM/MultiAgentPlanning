(define (domain obfuscated_deceptive_logistics_26)
  (:requirements :strips)
  (:predicates
    (hand ?v)
    (cats ?p)
    (texture ?l)
    (vase ?v ?p)
    (next ?o ?l)
    (sneeze ?p)
    (stupendous ?c)
    (collect ?l ?c)
    (spring ?l)
  )

  (:action paltry
    :parameters (?v ?p ?l)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (vase ?v ?p) (next ?p ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )

  (:action sip
    :parameters (?v ?p ?l)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v ?p ?l)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?p ?l1 ?l2 ?c)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?c) (next ?p ?l1) (collect ?l1 ?c) (collect ?l2 ?c))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action memory
    :parameters (?p ?l1 ?l2)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action tightfisted
    :parameters (?v ?p ?l)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?v ?p))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )
)