(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    thomas dylan jerry - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (meeting_scheduled)
  )

  (:action schedule_1h_meeting
    :parameters (?t1 - timeslot ?t2 - timeslot)
    :precondition (and
      (next ?t1 ?t2)
      (available thomas ?t1)
      (available thomas ?t2)
      (available dylan ?t1)
      (available dylan ?t2)
      (available jerry ?t1)
      (available jerry ?t2)
    )
    :effect (and
      (meeting_scheduled)
    )
  )
)