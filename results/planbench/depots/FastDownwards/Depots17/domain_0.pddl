(define (domain multi-agent-assignment)
  (:requirements :typing :strips)
  (:types agent task location slot)

  (:predicates
    (agent-available ?a - agent)
    (agent-at ?a - agent ?l - location)
    (can-perform ?a - agent ?t - task)
    (task-unassigned ?t - task)
    (task-at ?t - task ?l - location)
    (task-completed ?t - task)
    (slot-free ?s - slot)
    (must-use-slot ?t - task ?s - slot)
  )

  ;; Assign and complete a task by an agent at the same location and using a required slot.
  ;; This action represents allocation and execution as an atomic step (no temporal modeling).
  (:action assign-and-complete
    :parameters (?a - agent ?t - task ?s - slot ?l - location)
    :precondition (and
      (agent-available ?a)
      (agent-at ?a ?l)
      (task-unassigned ?t)
      (task-at ?t ?l)
      (slot-free ?s)
      (can-perform ?a ?t)
      (must-use-slot ?t ?s)
    )
    :effect (and
      (not (task-unassigned ?t))
      (not (slot-free ?s))
      (task-completed ?t)
      (not (must-use-slot ?t ?s))
    )
  )
)