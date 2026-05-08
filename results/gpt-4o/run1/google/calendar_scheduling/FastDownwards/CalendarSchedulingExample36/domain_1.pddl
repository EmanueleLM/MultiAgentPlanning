(define (domain meeting_scheduler)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    time_slot
  )
  (:predicates
    (available ?p - participant ?t - time_slot)
    (meeting_time ?t - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition
      (and
        (available ryan ?t)
        (available ruth ?t)
        (available denise ?t)
      )
    :effect
      (meeting_time ?t)
  )
)