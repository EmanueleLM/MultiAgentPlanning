(define (domain meeting_schedule_monday)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    theresa charles betty - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (candidate_start ?s - slot)
    (meeting_scheduled)
    (meeting_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (meeting_scheduled))
      (candidate_start ?s1)
      (next_slot ?s1 ?s2)
      (free theresa ?s1)
      (free theresa ?s2)
      (free charles ?s1)
      (free charles ?s2)
      (free betty ?s1)
      (free betty ?s2)
    )
    :effect (and
      (meeting_scheduled)
      (meeting_start ?s1)
    )
  )
)