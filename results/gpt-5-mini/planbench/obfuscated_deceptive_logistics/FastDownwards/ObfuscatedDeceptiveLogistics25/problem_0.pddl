(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    ana1 ana2 - analyst
    aud1 - auditor
    orch1 - orchestrator
    t1 t2 - task
    d1 d2 - dataset
    r1 r2 - report
    p1 p2 p3 - phase
  )

  (:init
    ; Phase ordering and starting phase (contiguity enforced)
    (successor p1 p2)
    (successor p2 p3)
    (current-phase p1)

    ; Task assignments and dataset requirements
    (assigned t1 ana1)
    (assigned t2 ana2)
    (requires t1 d1)
    (requires t2 d2)

    ; Dataset availability tied to explicit phases
    (data-available d1 p1)
    (data-available d2 p2)

    ; Reports ownership and correspondence to tasks
    (report-for r1 t1)
    (report-for r2 t2)
    (report-owned-by r1 ana1)
    (report-owned-by r2 ana2)

    ; Auditor assignments
    (assigned-auditor r1 aud1)
    (assigned-auditor r2 aud1)
  )

  ; The final conditions required by the public specification:
  ; - Both tasks completed
  ; - Both reports approved by the auditor
  ; - The workflow has advanced through the phases to the final phase (p3)
  (:goal (and
           (completed t1)
           (completed t2)
           (approved r1)
           (approved r2)
           (current-phase p3)
         )
  )
)