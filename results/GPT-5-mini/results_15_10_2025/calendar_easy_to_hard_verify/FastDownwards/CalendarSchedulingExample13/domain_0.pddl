(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types agent slot)

  (:predicates
    (free ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  ;; Schedule a 30-minute meeting at a single 30-minute slot.
  ;; Preconditions require every participant to be free at that slot.
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