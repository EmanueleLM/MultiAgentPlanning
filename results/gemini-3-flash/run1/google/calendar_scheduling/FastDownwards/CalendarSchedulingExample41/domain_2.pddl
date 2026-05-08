(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:constants alan nancy patricia - person)
  (:predicates
    (is_busy ?p - person ?t - timeslot)
    (meeting_success)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and 
      (not (is_busy alan ?t))
      (not (is_busy nancy ?t))
      (not (is_busy patricia ?t))
    )
    :effect (meeting_success)
  )
)