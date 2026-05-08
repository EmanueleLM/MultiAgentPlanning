(define (domain meeting_schedule_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (allowed_start ?s - slot)
    (meeting_started ?s - slot)
    (meeting_scheduled)
  )

  (:action start_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (allowed_start ?s1)
      (next_slot ?s1 ?s2)
      (not (busy ryan ?s1))
      (not (busy ryan ?s2))
      (not (busy ruth ?s1))
      (not (busy ruth ?s2))
      (not (busy denise ?s1))
      (not (busy denise ?s2))
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_started ?s1)
    )
  )

  (:action finalize_meeting
    :parameters (?s1 - slot)
    :precondition (and
      (meeting_started ?s1)
      (not (meeting_scheduled))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)