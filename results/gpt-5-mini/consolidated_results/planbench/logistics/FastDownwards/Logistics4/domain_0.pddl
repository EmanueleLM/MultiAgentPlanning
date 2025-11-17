(define (domain orchestrated-collection)
  (:requirements :strips :typing :negative-preconditions)
  (:types human cat obj phase texture)

  (:predicates
    (hand ?h - human ?o - obj)
    (cats ?c - cat ?p - phase)
    (texture ?o - obj ?t - texture)
    (vase ?o - obj)
    (next ?p1 - phase ?p2 - phase)
    (sneeze ?p - phase)
    (stupendous ?h - human)
    (collect ?h - human ?o - obj)
    (spring ?p - phase)
  )

  ; Human picks up an object during the current phase.
  (:action pick-up
    :parameters (?h - human ?o - obj ?p - phase)
    :precondition (and
      (spring ?p)
      (not (collect ?h ?o))
      (not (hand ?h ?o))
    )
    :effect (and
      (hand ?h ?o)
    )
  )

  ; Human stores an object into their collection during the current phase.
  (:action store
    :parameters (?h - human ?o - obj ?p - phase)
    :precondition (and
      (spring ?p)
      (hand ?h ?o)
      (not (collect ?h ?o))
    )
    :effect (and
      (collect ?h ?o)
      (not (hand ?h ?o))
    )
  )

  ; Advance from one phase to its immediate successor. Enforces contiguity via next.
  (:action advance-phase
    :parameters (?p1 - phase ?p2 - phase)
    :precondition (and
      (spring ?p1)
      (next ?p1 ?p2)
    )
    :effect (and
      (not (spring ?p1))
      (spring ?p2)
    )
  )

  ; Cat can sneeze in a phase when present there and that phase is active.
  ; Sneeze occurrence is permanent for the phase (sneeze fact added).
  (:action cat-sneeze
    :parameters (?c - cat ?p - phase)
    :precondition (and
      (cats ?c ?p)
      (spring ?p)
      (not (sneeze ?p))
    )
    :effect (and
      (sneeze ?p)
    )
  )

  ; The human can declare themselves stupendous in a phase after collecting two non-vase objects.
  ; This action is parameterized by the two collected objects (explicit enumeration avoids implicit quantification).
  (:action declare-stupendous
    :parameters (?h - human ?p - phase ?o1 - obj ?o2 - obj)
    :precondition (and
      (spring ?p)
      (collect ?h ?o1)
      (collect ?h ?o2)
      (not (vase ?o1))
      (not (vase ?o2))
    )
    :effect (and
      (stupendous ?h)
    )
  )
)