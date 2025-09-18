(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types participant hour meeting)

  (:predicates
    (free ?p - participant ?h - hour)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?h - hour)
    (meeting_planned)
  )

  (:action schedule_meeting
    :parameters (?m - meeting ?h - hour ?p1 - participant ?p2 - participant ?p3 - participant)
    :precondition (and
      (unscheduled ?m)
      (free ?p1 ?h) (free ?p2 ?h) (free ?p3 ?h)
    )
    :effect (and
      (meeting_planned)
      (scheduled ?m ?h)
      (not (unscheduled ?m))
      (not (free ?p1 ?h)) (not (free ?p2 ?h)) (not (free ?p3 ?h))
    )
  )
)