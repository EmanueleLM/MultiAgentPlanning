(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person timeslot)
  (:predicates
    (free ?p - person ?t - timeslot)
    (is_alexander ?p - person)
    (is_elizabeth ?p - person)
    (is_walter ?p - person)
    (scheduled)
  )

  ;; The action to schedule a 30-minute meeting for the three specific participants.
  ;; We use specific predicates to ground the participants to this instance.
  (:action schedule_meeting
    :parameters (?t - timeslot ?a - person ?e - person ?w - person)
    :precondition (and
      (is_alexander ?a)
      (is_elizabeth ?e)
      (is_walter ?w)
      (free ?a ?t)
      (free ?e ?t)
      (free ?w ?t)
    )
    :effect (scheduled)
  )
)