(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_1h_meeting
    :parameters (?t1 ?t2 - timeslot)
    :precondition (and
      (next ?t1 ?t2)
      (available stephen ?t1)
      (available stephen ?t2)
      (available edward ?t1)
      (available edward ?t2)
      (available angela ?t1)
      (available angela ?t2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)