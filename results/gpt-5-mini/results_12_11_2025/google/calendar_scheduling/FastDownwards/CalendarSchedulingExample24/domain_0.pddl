(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (available ?p - participant ?s - slot)
    (slot-in-window ?s - slot)
    (benjamin-allowed ?s - slot)
    (chosen ?s - slot)
    (scheduled ?s - slot)
    (attended ?p - participant ?s - slot)
  )

  (:action choose-slot
    :parameters (?s - slot)
    :precondition (and
      (slot-in-window ?s)
      (not (chosen ?s))
      (benjamin-allowed ?s)
      (available Benjamin ?s)
      (available Hannah ?s)
      (available Brenda ?s)
    )
    :effect (and
      (chosen ?s)
      (scheduled ?s)
      (attended Benjamin ?s)
      (attended Hannah ?s)
      (attended Brenda ?s)
    )
  )
)