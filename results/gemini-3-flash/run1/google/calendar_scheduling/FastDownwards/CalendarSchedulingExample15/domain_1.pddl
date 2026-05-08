(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person time_slot)
  (:constants
    joyce christine alexander - person
  )
  (:predicates
    (person_busy ?p - person ?t - time_slot)
    (meeting_scheduled)
  )
  (:action schedule_meeting
    :parameters (?t - time_slot)
    :precondition (and
      (not (person_busy joyce ?t))
      (not (person_busy christine ?t))
      (not (person_busy alexander ?t))
    )
    :effect (meeting_scheduled)
  )
)