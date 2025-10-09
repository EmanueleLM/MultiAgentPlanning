(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (free ?person - person ?slot - slot)
    (slot-allowed ?start - slot)
    (scheduled)
    (scheduled-at ?start - slot)
    (next ?s1 - slot ?s2 - slot)
  )

  (:action schedule-slot
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (slot-allowed ?start)
      (next ?start ?next)
      (not (scheduled))
      (free thomas ?start) (free thomas ?next)
      (free dylan ?start) (free dylan ?next)
      (free jerry ?start) (free jerry ?next)
    )
    :effect (and (scheduled) (scheduled-at ?start))
  )
)