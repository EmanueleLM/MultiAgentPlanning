(define (problem workflow-instance-1)
  (:domain workflow-integration)

  (:objects
    obs - agent
    reasoner - agent
    auditor - agent

    observe infer audit remediate - task

    s1 s2 s3 s4 - slot
  )

  (:init
    ;; Capabilities (who can do which task)
    (capable obs observe)
    (capable reasoner infer)
    (capable auditor audit)
    (capable auditor remediate)

    ;; Hard constraints: each task is assigned to an exact slot (preferences treated as hard constraints)
    (task-slot observe s1)
    (task-slot infer   s2)
    (task-slot audit   s3)
    (task-slot remediate s4)

    ;; Slot availability initially
    (empty s1)
    (empty s2)
    (empty s3)
    (empty s4)

    ;; Enforce contiguous ordered sequence: s1 -> s2 -> s3 -> s4 (no reordering allowed)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
  )

  ;; Goal: all tasks completed in their mandated slots (terminal conditions)
  (:goal (and
    (done-at observe s1)
    (done-at infer s2)
    (done-at audit s3)
    (done-at remediate s4)
  ))
)