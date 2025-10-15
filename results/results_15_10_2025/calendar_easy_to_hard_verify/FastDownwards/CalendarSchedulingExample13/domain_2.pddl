(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent slot)

  (:constants diane jack eugene patricia - agent)

  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action schedule-meeting
    :parameters (?s - slot)
    :precondition (and
      (free diane ?s)
      (free jack ?s)
      (free eugene ?s)
      (free patricia ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)