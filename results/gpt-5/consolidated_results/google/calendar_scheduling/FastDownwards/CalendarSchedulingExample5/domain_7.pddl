(define (domain meeting-scheduling-monday-30min)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)
  (:constants
    kathryn charlotte lauren - person
  )
  (:predicates
    (available ?p - person ?s - slot)
    (selected ?s - slot)
    (scheduled)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (available kathryn ?s)
      (available charlotte ?s)
      (available lauren ?s)
      (not (selected ?s))
    )
    :effect (and
      (selected ?s)
    )
  )

  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (selected ?s)
    :effect (and
      (scheduled)
    )
  )
)