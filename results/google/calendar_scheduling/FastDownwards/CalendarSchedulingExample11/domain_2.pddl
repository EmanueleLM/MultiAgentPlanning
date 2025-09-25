(define (domain meeting-scheduling-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (attending-ready ?a - agent ?s - slot)
    (slotted ?s - slot)
    (meeting-scheduled ?s - slot)
    (meeting-scheduled-done)
  )

  (:action prepare-attend
    :parameters (?a - agent ?s - slot)
    :precondition (and (free ?a ?s) (not (slotted ?s)))
    :effect (attending-ready ?a ?s)
  )

  (:action schedule-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent ?a3 - agent)
    :precondition (and
      (attending-ready ?a1 ?s)
      (attending-ready ?a2 ?s)
      (attending-ready ?a3 ?s)
      (not (slotted ?s))
    )
    :effect (and
      (meeting-scheduled ?s)
      (slotted ?s)
      (meeting-scheduled-done)
    )
  )
)