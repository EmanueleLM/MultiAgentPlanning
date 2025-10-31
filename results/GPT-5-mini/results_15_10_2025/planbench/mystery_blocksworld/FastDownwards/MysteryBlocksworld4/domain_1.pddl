(define (domain multi-agent-scheduling)
  (:requirements :typing)
  (:types agent slot)

  (:predicates
    (available ?a - agent ?s - slot)
    (free ?s - slot)
    (allowed ?s - slot)
    (reserved ?s - slot)
    (reserved-for ?s - slot ?a - agent)
    (notified ?a - agent ?s - slot)
    (meeting-scheduled)
  )

  (:action reserve
    :parameters (?a - agent ?s - slot)
    :precondition (and (free ?s) (available ?a ?s) (allowed ?s))
    :effect (and (reserved ?s) (reserved-for ?s ?a) (not (free ?s)))
  )

  (:action notify
    :parameters (?a - agent ?s - slot)
    :precondition (and (reserved ?s) (reserved-for ?s ?a))
    :effect (notified ?a ?s)
  )

  (:action finalize-meeting
    :parameters (?s - slot ?a1 - agent ?a2 - agent)
    :precondition (and (reserved ?s) (notified ?a1 ?s) (notified ?a2 ?s))
    :effect (meeting-scheduled)
  )
)