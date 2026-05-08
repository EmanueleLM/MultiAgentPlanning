(define (problem orchestrator-problem)
  (:domain orchestration)

  (:objects
    a1 a2 - agent
    t1 t2 t3 - task
    p1 p2 p3 - phase
    l1 l2 - location
  )

  (:init
    ;; Task assignments to explicit phases (enforces tasks must be executed in these phases)
    (task-assigned t1 p1)
    (task-assigned t2 p2)
    (task-assigned t3 p3)

    ;; Each task requires a specific location to be started/finished (hard constraints)
    (task-required-location t1 l1)
    (task-required-location t2 l1)
    (task-required-location t3 l2)

    ;; Initial positions of agents
    (at a1 l1)
    (at a2 l2)

    ;; Phase ordering; contiguity enforced via next/advance-phase
    (current-phase p1)
    (next p1 p2)
    (next p2 p3)

    ;; Location connectivity
    (adjacent l1 l2)
    (adjacent l2 l1)
  )

  (:goal
    (and
      ;; All mandated terminal conditions: every task must be finished.
      (task-finished t1)
      (task-finished t2)
      (task-finished t3)

      ;; Final phase must be the last phase in the explicit order.
      (current-phase p3)

      ;; Final agent locations are mandated terminal conditions.
      (at a1 l2)
      (at a2 l2)
    )
  )
)