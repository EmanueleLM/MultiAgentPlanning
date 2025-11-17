(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent phase artifact)

  (:predicates
    ; phase completion status
    (phase-completed ?p - phase)
    ; successor relation to enforce ordered sequence of phases
    (phase-next ?p1 - phase ?p2 - phase)
    ; artifacts produced by phases
    (artifact-produced ?a - artifact)
  )

  ; Action performed by the analysis player: produce the analysis artifact and complete the analysis phase.
  (:action analysis_player_generate_analysis
    :precondition (and
      (phase-next analysis plan) ; static contingency: analysis must precede plan (enforces explicit order relation)
      (not (phase-completed analysis))
      (not (artifact-produced analysis_doc))
    )
    :effect (and
      (phase-completed analysis)
      (artifact-produced analysis_doc)
    )
  )

  ; Action performed by the local plan assistant: create plan artifact, requires analysis completed.
  (:action local_plan_assistant_create_plan
    :precondition (and
      (phase-next analysis plan) ; enforces contiguity relation exists
      (phase-completed analysis)
      (not (phase-completed plan))
      (not (artifact-produced plan_doc))
    )
    :effect (and
      (phase-completed plan)
      (artifact-produced plan_doc)
    )
  )

  ; Action performed by the audit/report agent: apply audit corrections, requires plan completed.
  (:action audit_report_apply_corrections
    :precondition (and
      (phase-next plan audit) ; enforces contiguity relation exists
      (phase-completed plan)
      (artifact-produced plan_doc)
      (not (phase-completed audit))
      (not (artifact-produced audited_doc))
    )
    :effect (and
      (phase-completed audit)
      (artifact-produced audited_doc)
    )
  )

  ; Finalization action (orchestrator): finalize the product, requires audited artifact.
  (:action orchestrator_finalize
    :precondition (and
      (phase-next audit finalize) ; enforces contiguity relation exists
      (phase-completed audit)
      (artifact-produced audited_doc)
      (not (phase-completed finalize))
      (not (artifact-produced final_doc))
    )
    :effect (and
      (phase-completed finalize)
      (artifact-produced final_doc)
    )
  )
)