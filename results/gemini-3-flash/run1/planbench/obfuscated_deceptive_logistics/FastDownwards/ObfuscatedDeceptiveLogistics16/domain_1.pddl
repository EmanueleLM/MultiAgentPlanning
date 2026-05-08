(define (domain obfuscated_deceptive_logistics_16)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (vase ?truck ?package)
    (next ?obj ?loc)
    (sneeze ?o)
    (stupendous ?o)
    (collect ?loc ?region)
    (spring ?o)
  )

  (:action paltry
    :parameters (?t ?p ?l)
    :precondition (and (hand ?t) (cats ?p) (texture ?l) (vase ?t ?p) (next ?p ?l))
    :effect (and (next ?t ?l) (not (vase ?t ?p)))
  )

  (:action sip
    :parameters (?t ?p ?l)
    :precondition (and (hand ?t) (cats ?p) (texture ?l) (next ?t ?l) (next ?p ?l))
    :effect (and (vase ?t ?p) (not (next ?t ?l)))
  )

  (:action clip
    :parameters (?t ?p ?l)
    :precondition (and (hand ?t) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?t ?l))
    :effect (and (vase ?t ?p) (not (next ?t ?l)))
  )

  (:action wretched
    :parameters (?p ?l1 ?l2 ?r)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?r) (next ?p ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action memory
    :parameters (?p ?l1 ?l2)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action tightfisted
    :parameters (?t ?p ?l)
    :precondition (and (hand ?t) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?t ?p))
    :effect (and (next ?t ?l) (not (vase ?t ?p)))
  )
)