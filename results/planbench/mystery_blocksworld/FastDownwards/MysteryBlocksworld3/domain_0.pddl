(define (domain multi-agent-template)
  (:requirements :strips :typing)
  (:types agent task location timeslot resource)
  (:predicates
    ; agent/location
    (at ?ag - agent ?loc - location)
    ; task status
    (task-pending ?t - task)
    (task-done ?t - task)
    ; assignments and reservation
    (assigned ?t - task ?ag - agent ?ts - timeslot)
    (free-slot ?ts - timeslot)
    (reserved ?ts - timeslot)
    ; resource availability
    (resource-available ?r - resource)
    (using ?ag - agent ?r - resource)
  )

  ; Placeholder action for actions from planner_A
  (:action plannerA_do_task
    :parameters (?ag - agent ?t - task ?loc - location ?ts - timeslot ?r - resource)
    :precondition (and
      (at ?ag ?loc)
      (task-pending ?t)
      (free-slot ?ts)
      (resource-available ?r)
    )
    :effect (and
      (not (task-pending ?t))
      (task-done ?t)
      (assigned ?t ?ag ?ts)
      (not (free-slot ?ts))
      (reserved ?ts)
      (not (resource-available ?r))
      (using ?ag ?r)
    )
  )

  ; Placeholder action for actions from planner_B
  (:action plannerB_finalize_task
    :parameters (?ag - agent ?t - task ?ts - timeslot ?loc - location ?r - resource)
    :precondition (and
      (at ?ag ?loc)
      (task-done ?t)
      (assigned ?t ?ag ?ts)
      (using ?ag ?r)
    )
    :effect (and
      ; example: finalize frees resource and marks slot used
      (not (using ?ag ?r))
      (resource-available ?r)
    )
  )
)