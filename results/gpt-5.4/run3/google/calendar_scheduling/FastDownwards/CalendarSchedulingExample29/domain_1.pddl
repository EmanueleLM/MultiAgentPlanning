(define (domain monday_meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:predicates
    (busy ?p - participant ?s - slot)
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (start_candidate ?s - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
    (uses_slot ?s - slot)
  )

  (:action schedule_one_hour_meeting
    :parameters (?p1 - participant ?p2 - participant ?p3 - participant ?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (start_candidate ?s1)
      (next_slot ?s1 ?s2)
      (free ?p1 ?s1)
      (free ?p1 ?s2)
      (free ?p2 ?s1)
      (free ?p2 ?s2)
      (free ?p3 ?s1)
      (free ?p3 ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s1)
      (uses_slot ?s1)
      (uses_slot ?s2)
    )
  )
)