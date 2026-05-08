(define (domain meeting_schedule_monday_earliest)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (available ?p - participant ?s - slot)
    (jointly_free ?s - slot)
    (earliest_candidate ?s - slot)
    (scheduled)
    (chosen_slot ?s - slot)
  )

  (:action schedule_at_slot
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (jointly_free ?s)
      (earliest_candidate ?s)
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
    )
  )
)