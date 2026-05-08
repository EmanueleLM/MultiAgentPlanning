(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants
    alan nancy patricia - person
  )
  (:predicates
    (available ?p - person ?s - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_half_hour_meeting
    :parameters (?s - timeslot)
    :precondition (and
      (available alan ?s)
      (available nancy ?s)
      (available patricia ?s)
    )
    :effect (meeting_scheduled)
  )
)