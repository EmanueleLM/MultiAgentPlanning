(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person time_slot)
  (:predicates
    (free ?p - person ?t - time_slot)
    (next ?t1 ?t2 - time_slot)
    (is_david ?p - person)
    (is_debra ?p - person)
    (is_kevin ?p - person)
    (meeting_scheduled)
  )

  (:action schedule_1hour_meeting
    :parameters (?p1 ?p2 ?p3 - person ?t1 ?t2 ?t3 - time_slot)
    :precondition (and
      ;; Bind participants to David, Debra, and Kevin
      (is_david ?p1)
      (is_debra ?p2)
      (is_kevin ?p3)
      ;; Ensure the time slots are consecutive (2 x 30 mins = 1 hour)
      (next ?t1 ?t2)
      (next ?t2 ?t3)
      ;; Everyone must be free during both 30-minute intervals
      (free ?p1 ?t1)
      (free ?p1 ?t2)
      (free ?p2 ?t1)
      (free ?p2 ?t2)
      (free ?p3 ?t1)
      (free ?p3 ?t2)
    )
    :effect (meeting_scheduled)
  )
)