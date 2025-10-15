(define (domain objects_domain)
  (:requirements :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj ?p - obj)
    (next ?o - obj ?p - obj)
    (collect ?o - obj ?p - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  (:action Paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (next ?x ?y) (hand ?z))
    :effect (and (next ?x ?z))
  )

  (:action Sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (sneeze ?x) (next ?y ?z))
    :effect (and (next ?y ?x))
  )

  (:action Clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (collect ?x ?y) (stupendous ?y) (texture ?x))
    :effect (and (next ?x ?z))
  )

  (:action Wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and (collect ?x ?y) (next ?z ?w) (spring ?z) (texture ?z))
    :effect (and (not (next ?z ?w)) (vase ?x ?y) (next ?x ?w))
  )

  (:action Memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (stupendous ?y) (texture ?z))
    :effect (and (next ?x ?z))
  )

  (:action Tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (collect ?y ?z))
    :effect (and (vase ?y ?z))
  )
)