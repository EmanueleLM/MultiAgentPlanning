(define (problem orchestrate-tasks)
  (:domain orchestration)

  (:objects
    alice bob - agent
    tA tB tC - task
    p1 p2 p3 - phase
  )

  (:init
    ;; Declare type membership (helpful but not strictly required)
    (agent alice)
    (agent bob)
    (task tA)
    (task tB)
    (task tC)
    (phase p1)
    (phase p2)
    (phase p3)

    ;; Ordered phase sequence (enforces strict order p1 -> p2 -> p3)
    (succ p1 p2)
    (succ p2 p3)

    ;; Task-phase membership (explicit, so finish-phase actions can refer to them)
    (task-in-phase tA p1)
    (task-in-phase tB p2)
    (task-in-phase tC p3)

    ;; Initial active phase: start at p1
    (phase-active p1)
    ;; p2 and p3 are not active initially; absence of (phase-active p2) and
    ;; (phase-active p3) in the init state means they are false.

    ;; Capabilities: which agent may perform which task
    ;; These are strict constraints: only the listed agent(s) may complete each task.
    (can-perform alice tA)
    (can-perform alice tC)
    (can-perform bob tB)

    ;; No tasks are completed initially; no phase is done initially.
  )

  ;; Final goal: all tasks completed and all phases marked done (explicit terminal conditions).
  (:goal (and
    (task-completed tA)
    (task-completed tB)
    (task-completed tC)
    (phase-done p1)
    (phase-done p2)
    (phase-done p3)
  ))