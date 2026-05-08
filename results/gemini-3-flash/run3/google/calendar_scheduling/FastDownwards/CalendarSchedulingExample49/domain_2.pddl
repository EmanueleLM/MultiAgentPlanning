(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants
    teresa kathleen patricia - person
  )
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (available teresa ?t)
      (available kathleen ?t)
      (available patricia ?t)
    )
    :effect (meeting_scheduled)
  )
)