(define (domain Logistics5)
  (:requirements :strips)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (sneeze ?o)
    (spring ?o)
    (stupendous ?o)
    (next ?o1 ?o2)
    (vase ?o1 ?o2)
    (collect ?o1 ?o2)
  )

  (:action paltry
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )

  (:action sip
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action clip
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action wretched
    :parameters (?x ?y ?z ?w)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w))
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y)))
  )

  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y)))
  )

  (:action tightfisted
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )
)