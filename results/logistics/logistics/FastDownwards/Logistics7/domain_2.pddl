(define (domain logistics7)
  (:requirements :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (stupendous ?o - obj)
  )

  (:action paltry
    :parameters (?s - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?s)
      (cats ?x)
      (texture ?y)
      (vase ?s ?x)
      (next ?x ?y)
    )
    :effect (and
      (next ?s ?y)
      (not (vase ?s ?x))
    )
  )

  (:action sip
    :parameters (?s - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?s)
      (cats ?x)
      (texture ?y)
      (next ?s ?y)
      (next ?x ?y)
    )
    :effect (and
      (vase ?s ?x)
      (not (next ?s ?y))
    )
  )

  (:action clip
    :parameters (?s - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?s)
      (sneeze ?x)
      (texture ?y)
      (next ?x ?y)
      (next ?s ?y)
    )
    :effect (and
      (vase ?s ?x)
      (not (next ?s ?y))
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  (:action tightfisted
    :parameters (?s - obj ?x - obj ?y - obj)
    :precondition (and
      (hand ?s)
      (sneeze ?x)
      (texture ?y)
      (next ?x ?y)
      (vase ?s ?x)
    )
    :effect (and
      (next ?s ?y)
      (not (vase ?s ?x))
    )
  )
)