(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types participant slot)
  (:predicates
    (free ?p - participant ?s - slot)
    (all-free ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule
    :parameters (?s - slot)
    :precondition (and (all-free ?s))
    :effect (and (meeting-scheduled)
                 (scheduled ?s)
                 (not (all-free ?s))
    )
  )
)