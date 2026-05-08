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
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (required joyce)
      (required christine)
      (required alexander)
      (available joyce ?s)
      (available christine ?s)
      (available alexander ?s)
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
    )
  )
)