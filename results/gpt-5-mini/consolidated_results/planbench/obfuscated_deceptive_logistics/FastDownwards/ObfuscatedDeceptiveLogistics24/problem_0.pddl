(define (problem multiagent-phased-tasks-prob)
  (:domain multiagent-phased-tasks)
  (:objects
    ;; agents (present for completeness; actions are distinguished by name)
    agentA agentB - agent

    ;; tasks to be completed
    task1 task2 - task

    ;; explicit phases including a 'none' start state so progression is single-step successor-based
    none p1 p2 p3 - phase
  )

  (:init
    ;; initial phase of each task is the explicit 'none' start
    (task-phase task1 none)
    (task-phase task2 none)

    ;; explicit ordered sequence of phases (enforces contiguous progression)
    (next none p1)
    (next p1 p2)
    (next p2 p3)
  )

  ;; Goal fixes all mandated terminal conditions:
  ;; - every task must have been verified
  ;; - every task must be in the final phase p3
  (:goal (and
           (verified task1)
           (task-phase task1 p3)
           (verified task2)
           (task-phase task2 p3)
         )
  )
)