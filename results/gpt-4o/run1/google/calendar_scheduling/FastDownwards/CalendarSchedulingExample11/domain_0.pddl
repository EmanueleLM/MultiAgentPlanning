(define (domain meeting_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant timeslot)
  (:predicates
    (busy ?p - participant ?t - timeslot)
    (meeting_scheduled ?t - timeslot)
    (available ?p - participant ?t - timeslot)
  )

  (:action Schedule_Meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (available alexander ?t)
      (available elizabeth ?t)
      (available walter ?t)
    )
    :effect (meeting_scheduled ?t)
  )
)