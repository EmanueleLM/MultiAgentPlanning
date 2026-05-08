(define (domain calendar_scheduling_26)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?ts - timeslot)
    (consecutive ?ts1 - timeslot ?ts2 - timeslot)
    (scheduled ?p1 - person ?p2 - person ?p3 - person)
  )

  (:action schedule_1h_meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?ts1 - timeslot ?ts2 - timeslot)
    :precondition (and
      (consecutive ?ts1 ?ts2)
      (free ?p1 ?ts1)
      (free ?p1 ?ts2)
      (free ?p2 ?ts1)
      (free ?p2 ?ts2)
      (free ?p3 ?ts1)
      (free ?p3 ?ts2)
    )
    :effect (scheduled ?p1 ?p2 ?p3)
  )
)