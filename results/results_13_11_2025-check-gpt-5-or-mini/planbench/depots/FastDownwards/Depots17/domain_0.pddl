(define (domain seq_flags)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    step
  )
  (:constants
    step_0 step_1 step_2 step_3 step_4 step_5 step_6 - step
  )
  (:predicates
    (hand ?s - step)
    (next ?a - step ?b - step)
    (cats)
    (sneeze)
    (spring)
    (stupendous)
    (texture)
    (vase)
    (collect)
  )

  (:action paltry
    :parameters ()
    :precondition (and
      (hand step_0)
      (next step_0 step_1)
      (not cats)
      (not sneeze)
      (not spring)
      (not stupendous)
      (not texture)
      (not vase)
      (not collect)
    )
    :effect (and
      (not (hand step_0))
      (hand step_1)
      (cats)
    )
  )

  (:action sip
    :parameters ()
    :precondition (and
      (hand step_1)
      (next step_1 step_2)
      (cats)
      (not sneeze)
    )
    :effect (and
      (not (hand step_1))
      (hand step_2)
      (sneeze)
    )
  )

  (:action clip
    :parameters ()
    :precondition (and
      (hand step_2)
      (next step_2 step_3)
      (cats)
      (sneeze)
      (not spring)
    )
    :effect (and
      (not (hand step_2))
      (hand step_3)
      (spring)
    )
  )

  (:action wretched
    :parameters ()
    :precondition (and
      (hand step_3)
      (next step_3 step_4)
      (spring)
      (not stupendous)
    )
    :effect (and
      (not (hand step_3))
      (hand step_4)
      (stupendous)
    )
  )

  (:action memory
    :parameters ()
    :precondition (and
      (hand step_4)
      (next step_4 step_5)
      (stupendous)
      (not texture)
    )
    :effect (and
      (not (hand step_4))
      (hand step_5)
      (texture)
    )
  )

  (:action tightfisted
    :parameters ()
    :precondition (and
      (hand step_5)
      (next step_5 step_6)
      (texture)
      (not vase)
      (not collect)
    )
    :effect (and
      (not (hand step_5))
      (hand step_6)
      (vase)
      (collect)
    )
  )
)