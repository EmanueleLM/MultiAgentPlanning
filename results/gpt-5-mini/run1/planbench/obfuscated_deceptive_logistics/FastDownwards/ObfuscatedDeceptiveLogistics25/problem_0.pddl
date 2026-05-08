(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    analystA analystB auditor orchestrator - agent
    collect1 analyze1 audit1 finalize1 - task
    p1 p2 p3 p4 - phase
  )

  (:init
    ;; Phase ordering and initial active phase
    (phase-succ p1 p2)
    (phase-succ p2 p3)
    (phase-succ p3 p4)
    (phase-active p1)

    ;; Task assignments and their phase membership
    (assigned collect1 analystA)
    (task-in-phase collect1 p1)

    (assigned analyze1 analystB)
    (task-in-phase analyze1 p2)

    (assigned audit1 auditor)
    (task-in-phase audit1 p3)

    (assigned finalize1 orchestrator)
    (task-in-phase finalize1 p4)

    ;; No tasks completed initially; no audit passed; no report finalized.
  )

  ;; Final conditions: every mandated terminal condition is fixed explicitly.
  ;; - All workflow tasks completed
  ;; - Audit passed
  ;; - Final report finalized
  ;; - Final phase (p4) is active so the sequence is completed and cannot be reordered later
  (:goal (and
    (completed collect1)
    (completed analyze1)
    (completed audit1)
    (completed finalize1)
    (audit-passed)
    (report-finalized)
    (phase-active p4)
  ))
)