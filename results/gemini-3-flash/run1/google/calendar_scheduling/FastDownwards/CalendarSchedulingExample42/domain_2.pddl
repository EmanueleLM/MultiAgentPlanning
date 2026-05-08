(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants
    julie sean lori - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_one_hour_meeting
    :parameters (?t1 ?t2 - timeslot)
    :precondition (and
      (next ?t1 ?t2)
      (available julie ?t1)
      (available julie ?t2)
      (available sean ?t1)
      (available sean ?t2)
      (available lori ?t1)
      (available lori ?t2)
    )
    :effect (meeting_scheduled)
  )
)