(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates
    (available ?p - person ?s - slot)
    (done)
  )
  (:action schedule_meeting
    :parameters (?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (done)
  )
)