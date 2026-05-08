(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    time_slot
  )
  (:predicates
    (available ?p - participant ?t - time_slot)
    (busy ?p - participant ?t - time_slot)
    (meeting_scheduled ?t - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition
      (and
        (available ryan ?t)
        (available ruth ?t)
        (available denise ?t)
        (not (busy denise ?t))
      )
    :effect
      (meeting_scheduled ?t)
  )
)