(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    person
    timeslot
  )
  (:predicates
    (next ?t1 ?t2 - timeslot)
    (is_busy ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?ts1 ?ts2 - timeslot)
    :precondition (and
      (next ?ts1 ?ts2)
      (not (is_busy theresa ?ts1))
      (not (is_busy theresa ?ts2))
      (not (is_busy charles ?ts1))
      (not (is_busy charles ?ts2))
      (not (is_busy betty ?ts1))
      (not (is_busy betty ?ts2))
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)