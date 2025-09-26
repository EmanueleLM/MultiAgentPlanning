(define (domain meeting_scheduling)
  (:requirements :strips :typing)
  (:types agent time)

  (:predicates
    (free ?a - agent ?t - time)
    (slot ?t - time)
    (allowed ?t - time)
    (scheduled)
    (unscheduled)
  )

  (:action schedule_meeting
    :parameters (?time - time ?p1 - agent ?p2 - agent ?p3 - agent ?p4 - agent ?p5 - agent ?p6 - agent)
    :precondition (and
      (unscheduled)
      (slot ?time)
      (allowed ?time)
      (free ?p1 ?time)
      (free ?p2 ?time)
      (free ?p3 ?time)
      (free ?p4 ?time)
      (free ?p5 ?time)
      (free ?p6 ?time)
    )
    :effect (and
      (scheduled)
      (not (unscheduled))
    )
  )
)