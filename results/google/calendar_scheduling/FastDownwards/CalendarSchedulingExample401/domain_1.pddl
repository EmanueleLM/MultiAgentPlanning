(define (domain meeting-scheduling)
  (:requirements :typing)
  (:types orchestrator participant slot meeting)
  (:predicates
    (meeting ?m - meeting)
    (slot ?s - slot)
    (participant ?p - participant)
    (orchestrator ?o - orchestrator)
    (available ?p - participant ?s - slot)
    (unscheduled ?m - meeting)
    (scheduled ?m - meeting ?s - slot)
    (confirmed ?p - participant ?m - meeting ?s - slot)
  )

  (:action confirm
    :parameters (?p - participant ?m - meeting ?s - slot)
    :precondition (and (participant ?p) (meeting ?m) (slot ?s) (unscheduled ?m) (available ?p ?s))
    :effect (confirmed ?p ?m ?s)
  )

  (:action finalize-schedule
    :parameters (?o - orchestrator ?m - meeting ?s - slot ?evelyn - participant ?roy - participant ?billy - participant ?gregory - participant ?vincent - participant ?philip - participant ?william - participant)
    :precondition (and
      (orchestrator ?o) (meeting ?m) (slot ?s) (unscheduled ?m)
      (confirmed ?evelyn ?m ?s) (confirmed ?roy ?m ?s) (confirmed ?billy ?m ?s)
      (confirmed ?gregory ?m ?s) (confirmed ?vincent ?m ?s) (confirmed ?philip ?m ?s)
      (confirmed ?william ?m ?s)
    )
    :effect (and (not (unscheduled ?m)) (scheduled ?m ?s))
  )
)