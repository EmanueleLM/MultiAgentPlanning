(define (domain meeting-choice-earliest)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    participant slot
  )
  (:predicates
    (free ?p - participant ?s - slot)
    (slot60 ?s - slot)
    (within-work ?s - slot)
    (all-free ?s - slot)
    (current ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (blocked ?s - slot)
    (chosen ?s - slot)
    (unscheduled)
    (scheduled)
  )

  (:action block-slot-if-busy
    :parameters (?p - participant ?s - slot)
    :precondition (and
      (current ?s)
      (not (free ?p ?s))
    )
    :effect (blocked ?s)
  )

  (:action advance-to-next-slot
    :parameters (?s1 - slot ?s2 - slot)
    :precondition (and
      (current ?s1)
      (blocked ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)
    )
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (unscheduled)
      (current ?s)
      (not (blocked ?s))
      (slot60 ?s)
      (within-work ?s)
      (all-free ?s)
    )
    :effect (and
      (chosen ?s)
      (scheduled)
      (not (unscheduled))
    )
  )
)