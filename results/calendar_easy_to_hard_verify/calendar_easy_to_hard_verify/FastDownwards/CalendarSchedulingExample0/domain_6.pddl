(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types person slot)
  (:predicates
    (busy ?p - person ?s - slot)
    (next ?s - slot ?s2 - slot)
    (scheduled)
    (meeting_start ?s - slot)
  )
  (:action schedule
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (not (busy michelle ?s)) (not (busy michelle ?s2))
      (not (busy steven ?s)) (not (busy steven ?s2))
      (not (busy jerry ?s)) (not (busy jerry ?s2))
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (meeting_start ?s)
    )
  )
)