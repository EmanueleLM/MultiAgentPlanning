(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-set)
  )

  (:functions
    (total-cost)
    (slot-index ?s - slot)
    (bob-interruption ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-set))
      (available alice ?s)
      (available bob ?s)
      (available carol ?s)
    )
    :effect (and
      (meeting-scheduled ?s)
      (meeting-set)
      (increase (total-cost) (+ (* (slot-index ?s) 100) (bob-interruption ?s)))
    )
  )
)