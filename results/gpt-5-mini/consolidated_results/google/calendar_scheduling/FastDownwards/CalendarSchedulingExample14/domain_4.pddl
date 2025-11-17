(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot time)
  (:predicates
    (slot-free ?p - person ?s - slot)    ; person is free for the entire slot
    (within-hours ?s - slot)             ; slot is within work hours
    (slot-start ?s - slot ?t - time)     ; slot starts at time t
    (slot-end ?s - slot ?t - time)       ; slot ends at time t
    (succ ?t1 - time ?t2 - time)         ; temporal successor relation (discrete time steps)
    (scheduled)                          ; global flag: meeting scheduled
    (chosen ?s - slot)                   ; the slot chosen for the meeting
  )

  (:action choose-slot
    :parameters (?s - slot ?t1 - time ?t2 - time ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (within-hours ?s)
      (slot-start ?s ?t1)
      (slot-end ?s ?t2)
      (succ ?t1 ?t2)           ; enforces the slot spans contiguous discrete times (one step here)
      (slot-free ?p1 ?s)
      (slot-free ?p2 ?s)
      (slot-free ?p3 ?s)
      (not (scheduled))
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