(define (domain logistics_objects)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj hand cats sneeze stupendous)

  (:predicates
    (texture ?x - obj)
    (spring ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Action paltry: hand, cats enforced via parameter types
  (:action paltry
    :parameters (?x - hand ?y - cats ?z - obj)
    :precondition (and
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; Action sip
  (:action sip
    :parameters (?x - hand ?y - cats ?z - obj)
    :precondition (and
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; Action clip
  (:action clip
    :parameters (?x - hand ?y - sneeze ?z - obj)
    :precondition (and
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; Action wretched
  (:action wretched
    :parameters (?x - sneeze ?y - obj ?z - obj ?w - stupendous)
    :precondition (and
      (texture ?y)
      (texture ?z)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; Action memory
  (:action memory
    :parameters (?x - cats ?y - obj ?z - obj)
    :precondition (and
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; Action tightfisted
  (:action tightfisted
    :parameters (?x - hand ?y - sneeze ?z - obj)
    :precondition (and
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)