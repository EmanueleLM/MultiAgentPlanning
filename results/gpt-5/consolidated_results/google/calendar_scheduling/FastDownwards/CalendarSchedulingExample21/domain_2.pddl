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

  ; Mark the current slot as blocked if any participant is not free on it.
  (:action block-slot-if-busy
    :parameters (?p - participant ?s - slot)
    :precondition (and
      (current ?s)
      (not (free ?p ?s))
    )
    :effect (blocked ?s)
  )

  ; Advance the pointer to the next slot only after the current one is blocked.
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

  ; Choose the (current, unblocked) slot when it is a 60-minute slot within work hours and all participants are free.
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