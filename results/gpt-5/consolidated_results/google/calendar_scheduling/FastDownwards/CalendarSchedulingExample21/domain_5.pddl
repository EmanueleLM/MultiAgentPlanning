(define (domain calendar-meeting-ordered-slots)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (attendee ?p - participant)
    (slot60 ?s - slot)
    (within-work ?s - slot)
    (feasible ?s - slot)
    (cursor ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (chosen ?s - slot)
    (scheduled)
  )

  (:action advance-to-next-slot
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (cursor ?s1)
      (next ?s1 ?s2)
      (not (feasible ?s1))
    )
    :effect (and
      (not (cursor ?s1))
      (cursor ?s2)
    )
  )

  (:action choose-earliest-feasible
    :parameters (?s - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (cursor ?s)
      (feasible ?s)
      (slot60 ?s)
      (within-work ?s)
      (attendee ?p1)
      (attendee ?p2)
      (attendee ?p3)
      (free ?p1 ?s)
      (free ?p2 ?s)
      (free ?p3 ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)