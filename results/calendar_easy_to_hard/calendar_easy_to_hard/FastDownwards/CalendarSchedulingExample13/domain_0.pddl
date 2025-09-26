(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)
  (:predicates
    (agent ?p - participant)
    (slot ?s - slot)
    (free ?p - participant ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (slot ?s)
      (free diane ?s)
      (free jack ?s)
      (free eugene ?s)
      (free patricia ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled ?s)
    )
  )
)