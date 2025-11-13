(define (domain mysteryblocksworld10)
  (:requirements :strips)
  (:predicates
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (hand ?x)
    (next ?x ?y)
    (vase ?x ?y)
    (collect ?x ?y)
  )

  (:action paltry
    :parameters (?p0 ?p1 ?p2)
    :precondition (and
      (hand ?p0)
      (cats ?p1)
      (texture ?p2)
      (vase ?p0 ?p1)
      (next ?p1 ?p2)
    )
    :effect (and
      (next ?p0 ?p2)
      (not (vase ?p0 ?p1))
    )
  )

  (:action sip
    :parameters (?p0 ?p1 ?p2)
    :precondition (and
      (hand ?p0)
      (cats ?p1)
      (texture ?p2)
      (next ?p0 ?p2)
      (next ?p1 ?p2)
    )
    :effect (and
      (vase ?p0 ?p1)
      (not (next ?p0 ?p2))
    )
  )

  (:action clip
    :parameters (?p0 ?p1 ?p2)
    :precondition (and
      (hand ?p0)
      (sneeze ?p1)
      (texture ?p2)
      (next ?p1 ?p2)
      (next ?p0 ?p2)
    )
    :effect (and
      (vase ?p0 ?p1)
      (not (next ?p0 ?p2))
    )
  )

  (:action wretched
    :parameters (?p0 ?p1 ?p2 ?p3)
    :precondition (and
      (sneeze ?p0)
      (texture ?p1)
      (texture ?p2)
      (stupendous ?p3)
      (next ?p0 ?p1)
      (collect ?p1 ?p3)
      (collect ?p2 ?p3)
    )
    :effect (and
      (next ?p0 ?p2)
      (not (next ?p0 ?p1))
    )
  )

  (:action memory
    :parameters (?p0 ?p1 ?p2)
    :precondition (and
      (cats ?p0)
      (spring ?p1)
      (spring ?p2)
      (next ?p0 ?p1)
    )
    :effect (and
      (next ?p0 ?p2)
      (not (next ?p0 ?p1))
    )
  )

  (:action tightfisted
    :parameters (?p0 ?p1 ?p2)
    :precondition (and
      (hand ?p0)
      (sneeze ?p1)
      (texture ?p2)
      (next ?p1 ?p2)
      (vase ?p0 ?p1)
    )
    :effect (and
      (next ?p0 ?p2)
      (not (vase ?p0 ?p1))
    )
  )
)