(define (domain calendar_scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person timeslot)
  (:predicates
    (is_busy ?p - person ?t - timeslot)
    (appointment_made)
  )
  (:action schedule_meeting
    :parameters (?t - timeslot)
    :precondition (and
      (not (is_busy gerald ?t))
      (not (is_busy roy ?t))
      (not (is_busy barbara ?t))
    )
    :effect (appointment_made)
  )
)