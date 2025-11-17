(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    analysis plan audit finalize - phase
    analysis_doc plan_doc audited_doc final_doc - artifact
    analysis_player local_plan_assistant audit_report orchestrator - agent
  )
  (:init
    ; explicit ordered sequence: analysis -> plan -> audit -> finalize
    (phase-next analysis plan)
    (phase-next plan audit)
    (phase-next audit finalize)
    ; No phase is completed initially and no artifacts are produced initially.
    ; (The absence of phase-completed and artifact-produced facts is intentional;
    ; actions use negative preconditions to require they are not yet completed.)
  )
  (:goal (and
    ; All mandated terminal conditions must hold
    (phase-completed analysis)
    (phase-completed plan)
    (phase-completed audit)
    (phase-completed finalize)
    (artifact-produced final_doc)
  ))
)