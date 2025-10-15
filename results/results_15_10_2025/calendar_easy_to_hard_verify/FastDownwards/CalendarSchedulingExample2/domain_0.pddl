(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants roy kathryn amy - person)
  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (available ?p - person ?s - slot)
    (selected ?s - slot)
    (scheduled)
  )

  ;; Schedule action chooses one 30-minute slot that is available for Roy, Kathryn, and Amy.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
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