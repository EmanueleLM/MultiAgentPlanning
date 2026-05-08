(define (problem multiagent-seq-problem)
  (:domain multiagent-seq)
  (:objects
    agentA agentB - agent
    t1 t2 t3 - task
    l1 l2 l3 - loc
    s1 s2 s3 - slot
  )

  (:init
    ;; agent locations
    (at agentA l1)
    (at agentB l2)

    ;; task locations
    (task-at t1 l1)
    (task-at t2 l2)
    (task-at t3 l3)

    ;; assignments (hard constraints)
    (assigned t1 agentA)
    (assigned t2 agentB)
    (assigned t3 agentA)

    ;; task precedence chain (explicit)
    (succ-task t1 t2)
    (succ-task t2 t3)
    (terminal-task t3)

    ;; timeline slots and ordering (explicit contiguous sequence)
    (current-slot s1)
    (successor s1 s2)
    (successor s2 s3)
    (slot-last s3)

    ;; only the first task is initially ready (enforces order)
    (ready t1)
  )

  (:goal (and
    (task-done t1)
    (task-done t2)
    (task-done t3)
  ))
)