(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent ?a3 - agent ?a4 - agent)
    :precondition (and
      (free ?a1 ?s)
      (free ?a2 ?s)
      (free ?a3 ?s)
      (free ?a4 ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)