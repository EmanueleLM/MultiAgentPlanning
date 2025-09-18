(define (domain multi-agent-meeting)
  (:requirements :strips :typing)
  (:types person timeslot meeting)

  (:predicates
    ; Agent 1 predicates (from first agent)
    (available ?p - person ?t - timeslot)
    (meeting-scheduled ?t - timeslot)
    (meeting-scheduled-for ?t - timeslot ?p - person)

    ; Agent 2 predicates (from second agent) - renamed scheduled2 to avoid arity/name conflict
    (free ?p - person ?t - timeslot)
    (requires ?m - meeting ?p - person)
    (unscheduled ?m - meeting)
    (scheduled2 ?m - meeting ?t - timeslot)

    ; Agent 3 predicates (from third agent) - renamed person-p / meeting-p to avoid conflict with types
    (slot ?t - timeslot)
    (person-p ?p - person)
    (meeting-p ?m - meeting)
    (preferred ?p - person ?t - timeslot)
    (scheduled3 ?m - meeting ?t - timeslot ?p - person)
  )

  ; Action from agent 1 (kept distinct)
  (:action schedule_agent1
    :parameters (?t - timeslot ?p - person)
    :precondition (available ?p ?t)
    :effect (and
      (meeting-scheduled ?t)
      (meeting-scheduled-for ?t ?p)
      (not (available ?p ?t))
    )
  )

  ; Action from agent 2 (kept distinct)
  (:action schedule_agent2
    :parameters (?m - meeting ?t - timeslot ?p - person)
    :precondition (and
      (unscheduled ?m)
      (requires ?m ?p)
      (free ?p ?t)
    )
    :effect (and
      (scheduled2 ?m ?t)
      (not (unscheduled ?m))
      (not (free ?p ?t))
    )
  )

  ; Action from agent 3 (kept distinct)
  (:action schedule_agent3
    :parameters (?m - meeting ?t - timeslot ?p - person)
    :precondition (and
      (meeting-p ?m)
      (slot ?t)
      (person-p ?p)
      (available ?p ?t)
      (preferred ?p ?t)
    )
    :effect (and
      (scheduled3 ?m ?t ?p)
    )
  )
)