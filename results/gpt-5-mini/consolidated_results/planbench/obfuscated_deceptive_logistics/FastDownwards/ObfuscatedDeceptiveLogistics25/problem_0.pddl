(define (problem orchestration-problem)
  (:domain orchestration-domain)

  (:objects
    ; Agents
    analystA analystB auditor orchestrator - agent

    ; Tasks
    prepare-data analyze-data - task

    ; Phases (explicit ordered sequence)
    p1_data_collection p2_analysis p3_audit p4_finalized - phase
  )

  (:init
    ; Phase order
    (next p1_data_collection p2_analysis)
    (next p2_analysis p3_audit)
    (next p3_audit p4_finalized)

    ; Start in the first phase
    (current-phase p1_data_collection)

    ; Assignments and capabilities
    (assigned prepare-data analystA)
    (assigned analyze-data analystB)

    (can-perform analystA prepare-data)
    (can-perform analystB analyze-data)
    (can-perform auditor analyze-data) ; auditor may perform review on the analysis task

    ; Task-phase mappings: which phase transition performing a task effects
    ; prepare-data moves the global phase from data_collection -> analysis
    (task-phase prepare-data p1_data_collection p2_analysis)
    ; analyze-data moves the global phase from analysis -> audit
    (task-phase analyze-data p2_analysis p3_audit)
  )

  (:goal
    (and
      ; Terminal conditions required by the public specification:
      ; both tasks completed, the analysis reviewed by the auditor, and finalization completed,
      ; and the global phase must be the finalized phase.
      (completed prepare-data)
      (completed analyze-data)
      (reviewed analyze-data)
      (finalized)
      (current-phase p4_finalized)
    )
  )
)