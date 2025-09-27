(define (domain calendar-scheduling)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (scheduled ?s - slot)
  )
  (:action schedule-meeting
    :parameters (?s - slot ?j - agent ?w - agent ?f - agent ?r - agent)
    :precondition (and
      (free ?j ?s)
      (free ?w ?s)
      (free ?f ?s)
      (free ?r ?s)
    )
    :effect (and
      (scheduled ?s)
    )
  )
)