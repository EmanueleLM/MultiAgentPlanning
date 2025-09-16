(define (domain meeting-orchestrator)
  (:requirements :typing)
  (:types person time)
  (:predicates
    (busy ?p - person ?t - time)
    (meeting_at ?t - time)
  )
  (:action schedule-meeting
    :parameters (?p1 ?p2 ?p3 ?p4 - person ?t - time)
    :precondition (and
      (not (busy ?p1 ?t))
      (not (busy ?p2 ?t))
      (not (busy ?p3 ?t))
      (not (busy ?p4 ?t)))
    :effect (meeting_at ?t)
  )
)