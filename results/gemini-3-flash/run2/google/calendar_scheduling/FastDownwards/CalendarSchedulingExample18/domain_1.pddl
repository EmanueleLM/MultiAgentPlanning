(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (available ?p - person ?t - timeslot)
    (is_brian ?p - person)
    (is_billy ?p - person)
    (is_patricia ?p - person)
    (scheduled)
  )

  (:action schedule_meeting
    :parameters (?t - timeslot ?pbrian - person ?pbilly - person ?ppatricia - person)
    :precondition (and
      (is_brian ?pbrian)
      (is_billy ?pbilly)
      (is_patricia ?ppatricia)
      (available ?pbrian ?t)
      (available ?pbilly ?t)
      (available ?ppatricia ?t)
    )
    :effect (scheduled)
  )
)