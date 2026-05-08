(define (domain obfuscated_deceptive_logistics_38)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (sneeze ?o)
    (texture ?o)
    (spring ?o)
    (stupendous ?o)
    (next ?o1 ?o2)
    (vase ?o1 ?o2)
    (collect ?o1 ?o2)
  )

  (:action paltry
    :parameters (?p ?v ?l)
    :precondition (and (hand ?p) (cats ?v) (texture ?l) (vase ?p ?v) (next ?v ?l))
    :effect (and (next ?p ?l) (not (vase ?p ?v)))
  )

  (:action sip
    :parameters (?p ?v ?l)
    :precondition (and (hand ?p) (cats ?v) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?p ?v) (not (next ?p ?l)))
  )

  (:action clip
    :parameters (?p ?v ?l)
    :precondition (and (hand ?p) (sneeze ?v) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?p ?v) (not (next ?p ?l)))
  )

  (:action wretched
    :parameters (?v ?l1 ?l2 ?c)
    :precondition (and (sneeze ?v) (texture ?l1) (texture ?l2) (stupendous ?c) (next ?v ?l1) (collect ?l1 ?c) (collect ?l2 ?c))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action memory
    :parameters (?v ?l1 ?l2)
    :precondition (and (cats ?v) (spring ?l1) (spring ?l2) (next ?v ?l1))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action tightfisted
    :parameters (?p ?v ?l)
    :precondition (and (hand ?p) (sneeze ?v) (texture ?l) (next ?v ?l) (vase ?p ?v))
    :effect (and (next ?p ?l) (not (vase ?p ?v)))
  )
)