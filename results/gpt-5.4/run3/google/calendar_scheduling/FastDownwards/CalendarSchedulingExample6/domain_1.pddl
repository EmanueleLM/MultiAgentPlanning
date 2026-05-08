(define (domain monday_meeting_scheduling_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    thomas dylan jerry - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (next_slot ?s1 - slot ?s2 - slot)
    (scheduled)
    (meeting_start ?s - slot)
  )

  (:action schedule_meeting
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (not (scheduled))
      (next_slot ?s1 ?s2)
      (free thomas ?s1)
      (free thomas ?s2)
      (free dylan ?s1)
      (free dylan ?s2)
      (free jerry ?s1)
      (free jerry ?s2)
    )
    :effect (and
      (scheduled)
      (meeting_start ?s1)
    )
  )
)