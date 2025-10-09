(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types person slot)
  (:constants roy kathryn amy - person)
  (:predicates
    (available ?p - person ?s - slot)
    (selected ?s - slot)
    (scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (available roy ?s)
      (available kathryn ?s)
      (available amy ?s)
    )
    :effect (and
      (selected ?s)
      (scheduled)
    )
  )
)