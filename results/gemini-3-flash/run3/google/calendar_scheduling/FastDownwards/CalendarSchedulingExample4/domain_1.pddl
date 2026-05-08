(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:constants donna john billy - person)
  (:predicates
    (available ?p - person ?t - timeslot)
    (meeting_scheduled)
  )
  (:action schedule
    :parameters (?t - timeslot)
    :precondition (and
      (available donna ?t)
      (available john ?t)
      (available billy ?t)
    )
    :effect (meeting_scheduled)
  )
)