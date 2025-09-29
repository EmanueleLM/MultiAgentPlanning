(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types slot participant meeting)
  (:predicates
    (slot ?t - slot)
    (next ?t - slot ?t2 - slot)
    (participant ?p - participant)
    (free ?p - participant ?t - slot)
    (meeting ?m - meeting)
    (meeting-at ?m - meeting ?t - slot)
  )

  (:action schedule-meeting
    :parameters (?m - meeting ?t - slot ?t2 - slot ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (meeting ?m)
      (slot ?t) (slot ?t2)
      (next ?t ?t2)
      (participant ?p1) (participant ?p2) (participant ?p3)
      (free ?p1 ?t) (free ?p1 ?t2)
      (free ?p2 ?t) (free ?p2 ?t2)
      (free ?p3 ?t) (free ?p3 ?t2)
    )
    :effect (and
      (meeting-at ?m ?t)
    )
  )
)