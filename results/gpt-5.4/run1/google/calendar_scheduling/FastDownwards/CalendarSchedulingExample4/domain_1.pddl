(define (domain meeting_schedule_monday_halfhour)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    donna john billy - participant
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (legal_start ?s - slot)
    (scheduled)
    (chosen_slot ?s - slot)
  )

  (:action schedule_meeting_at
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (legal_start ?s)
      (not (busy donna ?s))
      (not (busy john ?s))
      (not (busy billy ?s))
    )
    :effect (and
      (scheduled)
      (chosen_slot ?s)
    )
  )
)