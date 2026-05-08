(define (domain calendar_scheduling)
  (:requirements :typing)
  (:types person timeslot)
  (:constants jeffrey virginia melissa - person)
  (:predicates
    (is_available ?p - person ?t - timeslot)
    (scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (is_available jeffrey ?t)
      (is_available virginia ?t)
      (is_available melissa ?t)
    )
    :effect (scheduled)
  )
)