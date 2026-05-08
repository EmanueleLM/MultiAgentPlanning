(define (domain calendarschedulingexample8)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    adam jerry matthew - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available adam ?t)
      (available jerry ?t)
      (available matthew ?t)
    )
    :effect (meeting_scheduled)
  )
)