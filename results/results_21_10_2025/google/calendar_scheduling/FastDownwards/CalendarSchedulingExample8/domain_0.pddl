(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot meeting)

  ;; Constants: distinct participants (kept as domain constants so actions can reference them directly)
  (:constants
    alice bob carol - person
  )

  (:predicates
    (free ?p - person ?t - timeslot)               ; participant ?p is free at timeslot ?t
    (meeting-scheduled ?m - meeting ?t - timeslot) ; meeting ?m is scheduled at timeslot ?t
    (scheduled ?m - meeting)                       ; meeting ?m has been scheduled (at some timeslot)
  )

  ;; Schedule a meeting at a specific timeslot only if every required participant is free for the full 30-minute slot.
  ;; The availability constraints of the participants are referenced directly by name (alice, bob, carol).
  (:action schedule
    :parameters (?m - meeting ?t - timeslot)
    :precondition (and
      (not (scheduled ?m))
      (free alice ?t)
      (free bob ?t)
      (free carol ?t)
    )
    :effect (and
      (scheduled ?m)
      (meeting-scheduled ?m ?t)
      (not (free alice ?t))
      (not (free bob ?t))
      (not (free carol ?t))
    )
  )
)