(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:constants heather nicholas zachary - person)
  (:predicates
    (available ?p - person ?s - slot)
    (is_preferred ?s - slot)
    (meeting_done)
  )
  (:functions
    (total-cost)
  )
  (:action schedule_meeting_preferred
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_done))
      (is_preferred ?s)
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting_done)
      (increase (total-cost) 1)
    )
  )
  (:action schedule_meeting_non_preferred
    :parameters (?s - slot)
    :precondition (and
      (not (meeting_done))
      (not (is_preferred ?s))
      (available heather ?s)
      (available nicholas ?s)
      (available zachary ?s)
    )
    :effect (and
      (meeting_done)
      (increase (total-cost) 10)
    )
  )
)