(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)

  (:constants kathryn charlotte lauren - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (selected ?s - slot)
    (meeting-scheduled)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (free kathryn ?s)
      (free charlotte ?s)
      (free lauren ?s)
    )
    :effect (and
      (meeting-scheduled)
      (selected ?s)
    )
  )
)