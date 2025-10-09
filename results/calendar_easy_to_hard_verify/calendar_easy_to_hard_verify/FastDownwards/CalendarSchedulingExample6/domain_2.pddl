(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?person - person ?slot - slot)
    (slot-allowed ?start - slot)
    (scheduled)
    (scheduled-at ?start - slot)
  )

  (:action schedule-slot
    :parameters (?start - slot)
    :precondition (and (slot-allowed ?start) (not (scheduled)))
    :effect (and (scheduled) (scheduled-at ?start))
  )
)