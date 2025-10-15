(define (domain multi_agent_domain)
  (:requirements :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (collect ?o1 - object ?o2 - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action paltry
    :parameters ()
    :precondition (and
      (hand object_0)
      (cats object_1)
      (texture object_2)
      (vase object_0 object_1)
      (next object_1 object_2)
    )
    :effect (and
      (next object_0 object_2)
      (not (vase object_0 object_1))
    )
  )

  (:action sip
    :parameters ()
    :precondition (and
      (hand object_0)
      (cats object_1)
      (texture object_2)
      (next object_0 object_2)
      (next object_1 object_2)
    )
    :effect (and
      (vase object_0 object_1)
      (not (next object_0 object_2))
    )
  )

  (:action clip
    :parameters ()
    :precondition (and
      (hand object_0)
      (sneeze object_1)
      (texture object_2)
      (next object_1 object_2)
      (next object_0 object_2)
    )
    :effect (and
      (vase object_0 object_1)
      (not (next object_0 object_2))
    )
  )

  (:action wretched
    :parameters ()
    :precondition (and
      (sneeze object_0)
      (texture object_1)
      (texture object_2)
      (stupendous object_3)
      (next object_0 object_1)
      (collect object_1 object_3)
      (collect object_2 object_3)
    )
    :effect (and
      (next object_0 object_2)
      (not (next object_0 object_1))
    )
  )

  (:action memory
    :parameters ()
    :precondition (and
      (cats object_0)
      (spring object_1)
      (spring object_2)
      (next object_0 object_1)
    )
    :effect (and
      (next object_0 object_2)
      (not (next object_0 object_1))
    )
  )

  (:action tightfisted
    :parameters ()
    :precondition (and
      (hand object_0)
      (sneeze object_1)
      (texture object_2)
      (next object_1 object_2)
      (vase object_0 object_1)
    )
    :effect (and
      (next object_0 object_2)
      (not (vase object_0 object_1))
    )
  )
)