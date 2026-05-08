(define (domain meeting_scheduling_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (acceptable_slot ?s - slot)
    (scheduled ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_scheduled))
      (acceptable_slot ?s)
      (not (busy teresa ?s))
      (not (busy kathleen ?s))
      (not (busy patricia ?s))
    )
    :effect (and
      (meeting_scheduled)
      (scheduled ?s)
    )
  )
)