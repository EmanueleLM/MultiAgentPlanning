(define (domain meeting_schedule_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    julie sean lori - participant
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (next_slot ?s1 ?s2)
      (not (scheduled))
      (not (busy julie ?s1))
      (not (busy julie ?s2))
      (not (busy sean ?s1))
      (not (busy sean ?s2))
      (not (busy lori ?s1))
      (not (busy lori ?s2))
    )
    :effect (scheduled)
  )
)