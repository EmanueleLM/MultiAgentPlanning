(define (domain multi-agent-phased-tasks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tool task phase)

  (:predicates
    (at ?ag - agent ?loc - location)
    (tool-at ?tool - tool ?loc - location)
    (tool-available ?tool - tool)
    (holding ?ag - agent ?tool - tool)
    (agent-free ?ag - agent)
    (current-phase ?p - phase)
    (phase-successor ?p1 - phase ?p2 - phase)
    (task-in-phase ?tsk - task ?p - phase)
    (task-location ?tsk - task ?loc - location)
    (task-done ?tsk - task)
    (requires-tool ?tsk - task ?tool - tool)
  )

  ;; Move an agent between locations
  (:action move-agent
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and (at ?ag ?from))
    :effect (and (at ?ag ?to) (not (at ?ag ?from)))
  )

  ;; Pick up a tool at the agent's current location if available and agent is free
  (:action pick-tool
    :parameters (?ag - agent ?tool - tool ?loc - location)
    :precondition (and (at ?ag ?loc) (tool-at ?tool ?loc) (tool-available ?tool) (agent-free ?ag))
    :effect (and (holding ?ag ?tool)
                 (not (tool-available ?tool))
                 (not (tool-at ?tool ?loc))
                 (not (agent-free ?ag)))
  )

  ;; Drop a tool at the agent's current location
  (:action drop-tool
    :parameters (?ag - agent ?tool - tool ?loc - location)
    :precondition (and (holding ?ag ?tool) (at ?ag ?loc))
    :effect (and (tool-at ?tool ?loc)
                 (tool-available ?tool)
                 (agent-free ?ag)
                 (not (holding ?ag ?tool)))
  )

  ;; Perform a task that does NOT require a tool
  (:action perform-task-no-tool
    :parameters (?tsk - task ?ag - agent ?p - phase ?loc - location)
    :precondition (and
                    (task-in-phase ?tsk ?p)
                    (task-location ?tsk ?loc)
                    (at ?ag ?loc)
                    (current-phase ?p)
                    (not (task-done ?tsk)))
    :effect (and (task-done ?tsk))
  )

  ;; Perform a task that requires holding a specific tool
  (:action perform-task-with-tool
    :parameters (?tsk - task ?ag - agent ?p - phase ?loc - location ?tool - tool)
    :precondition (and
                    (task-in-phase ?tsk ?p)
                    (task-location ?tsk ?loc)
                    (at ?ag ?loc)
                    (current-phase ?p)
                    (holding ?ag ?tool)
                    (requires-tool ?tsk ?tool)
                    (not (task-done ?tsk)))
    :effect (and (task-done ?tsk))
  )

  ;; Advance from phase p1 to its successor p2 when two specified tasks of p1 are done.
  ;; This action is provided to enforce that the listed tasks must be completed before the phase advances.
  (:action start-phase-2tasks
    :parameters (?p1 - phase ?p2 - phase ?t1 - task ?t2 - task)
    :precondition (and
                    (current-phase ?p1)
                    (phase-successor ?p1 ?p2)
                    (task-in-phase ?t1 ?p1)
                    (task-in-phase ?t2 ?p1)
                    (task-done ?t1)
                    (task-done ?t2))
    :effect (and (not (current-phase ?p1)) (current-phase ?p2))
  )

  ;; Advance from phase p1 to its successor p2 when one specified task of p1 is done.
  (:action start-phase-1task
    :parameters (?p1 - phase ?p2 - phase ?t1 - task)
    :precondition (and
                    (current-phase ?p1)
                    (phase-successor ?p1 ?p2)
                    (task-in-phase ?t1 ?p1)
                    (task-done ?t1))
    :effect (and (not (current-phase ?p1)) (current-phase ?p2))
  )
)