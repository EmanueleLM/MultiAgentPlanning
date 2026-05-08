(define (domain calendar_scheduling)
  (:requirements :strips :typing :action-costs)
  (:types person slot)
  (:predicates
    (is_free ?p - person ?s - slot)
    (scheduled)
  )
  (:functions
    (slot_cost ?s - slot)
    (total-cost)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (is_free jesse ?s)
      (is_free kathryn ?s)
      (is_free megan ?s)
    )
    :effect (and
      (scheduled)
      (increase (total-cost) (slot_cost ?s))
    )
  )
)