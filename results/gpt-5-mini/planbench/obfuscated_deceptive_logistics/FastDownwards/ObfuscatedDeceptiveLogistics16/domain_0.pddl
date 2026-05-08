(define (domain orchestration-domain)
  ; Domain for multi-agent orchestration integrating:
  ; - the modeler's creation of a symbolic model
  ; - the auditor's corrections
  ; - the simplifier's canonical mapping
  ; - the orchestrator's finalization
  ;
  ; Resolved assumptions (explicit):
  ; - There is exactly one model object being processed in the problem instance (object m1).
  ; - The process must proceed strictly in four contiguous phases: modeling -> audit -> simplify -> finalize.
  ; - Each actor (modeler, auditor, simplifier, orchestrator) is a distinct agent subtype and may perform only its designated actions.
  ; - All natural-language preferences (earliest, avoid, would rather) are implemented as hard ordering constraints (phases and preconditions).
  ;
  ; No bookkeeping tokens, penalty actions, or post-hoc corrections are provided. Violating the sequence or missing any required predicate makes a plan infeasible.
  (:requirements :strips :typing :negative-preconditions)

  (:types
    agent
    model
    phase
    ; agent subtypes (distinct capabilities)
    modeler auditor simplifier orchestrator - agent
  )

  (:predicates
    ; Phase control
    (phase-active ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)

    ; Explicit phase labels to bind actions to exact phases
    (model-phase ?p - phase)
    (audit-phase ?p - phase)
    (simplify-phase ?p - phase)
    (finalize-phase ?p - phase)

    ; State of the artifact (the symbolic model / mapping)
    (model-valid ?m - model)           ; model produced and syntactically valid
    (corrections-applied ?m - model)   ; auditor's corrections applied to the model
    (mapping-canonical ?m - model)     ; simplifier applied canonical mapping
    (finalized ?m - model)             ; orchestrator accepted & finalized the artifact
  )

  ; Action: modeler creates the initial symbolic model in the modeling phase
  (:action create-model
    :parameters (?ag - modeler ?m - model ?p - phase ?pnext - phase)
    :precondition (and
                    (phase-active ?p)
                    (model-phase ?p)
                    (phase-next ?p ?pnext)
                    (not (model-valid ?m))
                  )
    :effect (and
              (model-valid ?m)
              (not (phase-active ?p))
              (phase-active ?pnext)
            )
  )

  ; Action: auditor audits and applies corrections in the audit phase
  (:action audit-model
    :parameters (?ag - auditor ?m - model ?p - phase ?pnext - phase)
    :precondition (and
                    (phase-active ?p)
                    (audit-phase ?p)
                    (phase-next ?p ?pnext)
                    (model-valid ?m)
                    (not (corrections-applied ?m))
                  )
    :effect (and
              (corrections-applied ?m)
              (not (phase-active ?p))
              (phase-active ?pnext)
            )
  )

  ; Action: simplifier applies canonical mapping in the simplify phase
  (:action simplify-mapping
    :parameters (?ag - simplifier ?m - model ?p - phase ?pnext - phase)
    :precondition (and
                    (phase-active ?p)
                    (simplify-phase ?p)
                    (phase-next ?p ?pnext)
                    (corrections-applied ?m)
                    (not (mapping-canonical ?m))
                  )
    :effect (and
              (mapping-canonical ?m)
              (not (phase-active ?p))
              (phase-active ?pnext)
            )
  )

  ; Action: orchestrator finalizes the artifact in the finalize phase
  ; Finalization requires all previous artifact predicates true.
  (:action finalize
    :parameters (?ag - orchestrator ?m - model ?p - phase)
    :precondition (and
                    (phase-active ?p)
                    (finalize-phase ?p)
                    (model-valid ?m)
                    (corrections-applied ?m)
                    (mapping-canonical ?m)
                    (not (finalized ?m))
                  )
    :effect (and
              (finalized ?m)
              (not (phase-active ?p))
            )
  )

)