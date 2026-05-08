(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    orch1 - orchestrator
    w1 w2 - worker

    ;; Phases
    p1 p2 - phase

    ;; Tasks
    t1 t2 t3 - task
  )

  (:init
    ;; Orchestrator and worker availability
    (available-orch orch1)
    (available-worker w1)
    (available-worker w2)

    ;; Phase sequencing: p1 -> p2, and p2 is final
    (phase-next p1 p2)
    (phase-final p2)

    ;; Tasks assigned to phases
    (task-in-phase t1 p1)
    (task-in-phase t2 p1)
    (task-in-phase t3 p2)

    ;; In-phase task ordering:
    ;; Phase p1: t1 then t2 (t1 is first, t2 has predecessor t1 and is last for p1)
    (task-first t1)
    (task-predecessor t1 t2)
    (phase-last-task p1 t2)

    ;; Phase p2: single task t3 (first and last)
    (task-first t3)
    (phase-last-task p2 t3)

    ;; Active phase initially is p1
    (phase-active p1)
  )

  (:goal (and
    ;; All tasks completed
    (task-done t1)
    (task-done t2)
    (task-done t3)

    ;; All phases completed
    (phase-done p1)
    (phase-done p2)

    ;; Agents end available
    (available-worker w1)
    (available-worker w2)
    (available-orch orch1)
  ))
)