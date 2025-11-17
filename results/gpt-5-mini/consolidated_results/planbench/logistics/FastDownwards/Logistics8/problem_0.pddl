(define (problem orchestration-problem)
  (:domain orchestration-domain)
  (:objects
    planner1 - planner
    analyzer1 - analyzer
    auditor1 - auditor
    worker1 - worker

    task1 - task

    s1 s2 s3 s4 s5 - stage
  )

  (:init
    ; initial task location
    (task-at task1 s1)

    ; stage ordering (enforce strict sequence)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)

    ; agent availability
    (agent-available planner1)
    (agent-available analyzer1)
    (agent-available auditor1)
    (agent-available worker1)

    ; no analysis/approval/execution done yet -- these predicates are absent initially
    ; (i.e., not (analyzed task1)), etc.
  )

  (:goal (and
    (task-at task1 s5)
    (completed task1)
  ))
)