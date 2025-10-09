(define (domain meeting-scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)    ; agent is available at slot
    (proposed ?s - slot)                ; slot proposed/allowed (encodes earliest preference)
    (meeting-held)                      ; meeting has been scheduled
    (attending ?a - agent)              ; agent is scheduled to attend (slot implicit)
  )

  ;; Schedule a meeting at a proposed slot if every participant is available there.
  ;; Parameters: slot and the four participants (kept distinct by binding in the problem).
  (:action schedule-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent ?a3 - agent ?a4 - agent)
    :precondition (and
      (proposed ?s)
      (not (meeting-held))
      (available ?a1 ?s)
      (available ?a2 ?s)
      (available ?a3 ?s)
      (available ?a4 ?s)
    )
    :effect (and
      (meeting-held)
      (attending ?a1)
      (attending ?a2)
      (attending ?a3)
      (attending ?a4)
    )
  )
)