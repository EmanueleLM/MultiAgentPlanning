(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants margaret donna helen - person)

  (:predicates
    (available ?p - person ?s - slot)
    (scheduled ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (available margaret ?s)
      (available donna ?s)
      (available helen ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (scheduled ?s)
      (meeting-scheduled)
    )
  )
)