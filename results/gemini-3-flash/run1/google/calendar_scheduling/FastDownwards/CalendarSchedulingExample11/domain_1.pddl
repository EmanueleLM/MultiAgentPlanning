(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:constants alexander elizabeth walter - person)
  (:predicates
    (person_free ?p - person ?s - slot)
    (is_scheduled)
  )
  (:action schedule_meeting
    :parameters (?s - slot)
    :precondition (and
      (person_free alexander ?s)
      (person_free elizabeth ?s)
      (person_free walter ?s)
    )
    :effect (is_scheduled)
  )
)