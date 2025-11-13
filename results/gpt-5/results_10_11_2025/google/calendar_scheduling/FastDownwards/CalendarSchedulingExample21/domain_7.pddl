(define (domain calendar-meeting-ordered-slots-audited)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot
  )
  (:constants
    bobby scott kimberly - participant
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (slot60 ?s - slot)
    (within-work ?s - slot)
    (allowed ?s - slot)
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
      (not (allowed ?s1))
    )
    :effect (and
      (not (cursor ?s1))
      (cursor ?s2)
    )
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (cursor ?s)
      (allowed ?s)
      (slot60 ?s)
      (within-work ?s)
      (free bobby ?s)
      (free scott ?s)
      (free kimberly ?s)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?s)
    )
  )
)