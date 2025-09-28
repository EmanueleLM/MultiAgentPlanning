(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:constants
    wayne edward lauren helen michael joseph vincent - participant
  )
  (:predicates
    (slot ?s - slot)
    (available ?p - participant ?s - slot)
    (earliest ?s - slot)
    (scheduled ?s - slot)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (earliest ?s)
      (available wayne ?s)
      (available edward ?s)
      (available lauren ?s)
      (available helen ?s)
      (available michael ?s)
      (available joseph ?s)
      (available vincent ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)