(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot time)
  (:predicates
    (slot-free ?p - person ?s - slot)
    (within-hours ?s - slot)
    (slot-start ?s - slot ?t - time)
    (slot-end ?s - slot ?t - time)
    (succ ?t1 - time ?t2 - time)   ; successor relation enforces contiguous occupancy for the meeting duration
    (scheduled)
    (chosen ?s - slot)
  )

  (:action choose-slot
    :parameters (?s - slot ?t1 - time ?t2 - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (within-hours ?s)
      (slot-start ?s ?t1)
      (slot-end ?s ?t2)
      (succ ?t1 ?t2)                ; enforces the slot spans exactly one granularity step (30 minutes)
      (slot-free ?p1 ?s)
      (slot-free ?p2 ?s)
      (slot-free ?p3 ?s)
      (not (scheduled))             ; meeting not already scheduled
    )
    :effect (and
      (scheduled)
      (chosen ?s)
      (not (slot-free ?p1 ?s))
      (not (slot-free ?p2 ?s))
      (not (slot-free ?p3 ?s))
    )
  )
)