(define (problem phased-multiagent-example)
  (:domain multi-agent-phased-tasks)

  (:objects
    a1 a2 - agent
    locA locB - location
    wrench - tool
    t1 t2 t3 - task
    p1 p2 p3 - phase
  )

  (:init
    ;; Agent locations
    (at a1 locA)
    (at a2 locB)

    ;; Tool initial location and availability
    (tool-at wrench locA)
    (tool-available wrench)

    ;; Agents are initially free (not holding tools)
    (agent-free a1)
    (agent-free a2)

    ;; Phase order and starting phase
    (phase-successor p1 p2)
    (phase-successor p2 p3)
    (current-phase p1)

    ;; Tasks assigned to phases and locations
    (task-in-phase t1 p1)
    (task-location t1 locA)

    (task-in-phase t2 p1)
    (task-location t2 locA)

    (task-in-phase t3 p2)
    (task-location t3 locB)

    ;; Task t3 requires the wrench tool to perform
    (requires-tool t3 wrench)

    ;; No tasks are initially done
    ;; (task-done ...) absent for all tasks
  )

  (:goal (and
    (task-done t1)
    (task-done t2)
    (task-done t3)
    (current-phase p3)
  ))