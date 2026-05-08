(define (domain calendar_scheduling)
  (:requirements :strips :typing)
  (:types person slot)
  (:predicates 
    (is_free ?p - person ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (scheduled ?p1 - person ?p2 - person ?p3 - person)
  )

  (:action schedule_1hr_meeting
    :parameters (?p1 - person ?p2 - person ?p3 - person ?s1 - slot ?s2 - slot)
    :precondition (and 
      (next ?s1 ?s2)
      (is_free ?p1 ?s1) (is_free ?p1 ?s2)
      (is_free ?p2 ?s1) (is_free ?p2 ?s2)
      (is_free ?p3 ?s1) (is_free ?p3 ?s2)
    )
    :effect (scheduled ?p1 ?p2 ?p3)
  )
)