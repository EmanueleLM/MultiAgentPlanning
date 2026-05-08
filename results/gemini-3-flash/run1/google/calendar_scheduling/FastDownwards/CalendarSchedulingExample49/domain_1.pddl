(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person time_slot)
  (:predicates
    (busy ?p - person ?t - time_slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (not (busy teresa ?t))
      (not (busy kathleen ?t))
      (not (busy patricia ?t))
    )
    :effect (meeting_scheduled)
  )
)