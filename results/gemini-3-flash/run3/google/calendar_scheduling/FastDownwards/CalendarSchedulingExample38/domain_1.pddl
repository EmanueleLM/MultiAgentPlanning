(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (free catherine ?t)
      (free michael ?t)
      (free alexander ?t)
    )
    :effect (meeting_scheduled)
  )
)