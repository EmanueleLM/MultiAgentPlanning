(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant
    time_slot
  )
  (:predicates
    (available ?p - participant ?t - time_slot)
    (constraint_satisfied ?t - time_slot)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition
      (and
        (available ryan ?t)
        (available ruth ?t)
        (available denise ?t)
        (constraint_satisfied ?t)
      )
    :effect
      (constraint_satisfied ?t)
  )
)