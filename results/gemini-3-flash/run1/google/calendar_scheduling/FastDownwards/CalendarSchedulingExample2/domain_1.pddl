(define (domain calendar_scheduling)
  (:requirements :typing :action-costs :negative-preconditions)
  (:types person timeslot)
  (:constants
    roy kathryn amy - person
  )
  (:predicates
    (busy ?p - person ?ts - timeslot)
    (penalty ?ts - timeslot)
    (meeting_scheduled)
  )
  (:functions
    (total-cost)
  )
  (:action schedule_no_penalty
    :parameters (?ts - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy roy ?ts))
      (not (busy kathryn ?ts))
      (not (busy amy ?ts))
      (not (penalty ?ts))
    )
    :effect (and
      (meeting_scheduled)
      (increase (total-cost) 1)
    )
  )
  (:action schedule_with_penalty
    :parameters (?ts - timeslot)
    :precondition (and
      (not (meeting_scheduled))
      (not (busy roy ?ts))
      (not (busy kathryn ?ts))
      (not (busy amy ?ts))
      (penalty ?ts)
    )
    :effect (and
      (meeting_scheduled)
      (increase (total-cost) 10)
    )
  )
)