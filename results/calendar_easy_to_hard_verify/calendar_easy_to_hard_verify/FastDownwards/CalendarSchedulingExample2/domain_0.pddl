(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (scheduled)
    (selected ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
    )
    :effect (and
      (scheduled)
      (selected ?s)
    )
  )
)