(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (required ?p - participant)
    (available ?p - participant ?s - slot)
    (scheduled)
    (chosen_slot ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s - slot)
    :precondition (and
      (not (scheduled))
      (required ?p1)
      (required ?p2)
      (required ?p3)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
    )
  )
)