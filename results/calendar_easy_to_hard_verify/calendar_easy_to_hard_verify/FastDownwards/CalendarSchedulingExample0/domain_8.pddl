(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person slot)
  (:predicates
    (busy ?p - person ?s - slot)
    (next ?s - slot ?s2 - slot)
    (scheduled)
    (meeting_start ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?s2 - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (next ?s ?s2)
      (not (busy ?p1 ?s)) (not (busy ?p1 ?s2))
      (not (busy ?p2 ?s)) (not (busy ?p2 ?s2))
      (not (busy ?p3 ?s)) (not (busy ?p3 ?s2))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting_start ?s)
    )
  )
)