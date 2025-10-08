(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)
  (:predicates
    (slot ?s - slot)
    (agent ?a - agent)
    (free ?a ?s - slot)    ; agent is free for the 30-min slot ?s
    (scheduled)            ; a meeting has been scheduled
    (meeting-at ?s - slot) ; meeting is scheduled at slot ?s
  )

  ;; Schedule action: pick a 30-minute slot where every participant is free.
  (:action schedule
    :parameters (?s - slot)
    :precondition (and
      (not (scheduled))
      (free diane ?s)
      (free jack ?s)
      (free eugene ?s)
      (free patricia ?s)
    )
    :effect (and
      (scheduled)
      (meeting-at ?s)
    )
  )
)