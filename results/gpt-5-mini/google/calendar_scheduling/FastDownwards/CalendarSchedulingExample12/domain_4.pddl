(define (domain schedule_meeting)
  (:requirements :strips :typing)
  (:types person slot meeting)

  (:predicates
    (available ?p - person ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting)
    (scheduled_at ?m - meeting ?s - slot)
  )

  (:action schedule
    :parameters (?m - meeting ?s - slot ?p1 - person ?p2 - person ?p3 - person)
    :precondition (and
      (unscheduled ?m)
      (available ?p1 ?s)
      (available ?p2 ?s)
      (available ?p3 ?s)
    )
    :effect (and
      (not (unscheduled ?m))
      (scheduled ?m)
      (scheduled_at ?m ?s)
    )
  )
)