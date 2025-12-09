; Domain: multi-agent orchestration of a single PDDL artifact through modeling, auditing, simplification, and integration phases.
; Comments below resolve modeling choices and constraints explicitly:
; - We model one primary artifact "symbolic_model" that must be created, audited, mapped (simplifier canonical mapping), and integrated.
; - Agents are modeled as distinct subtypes: modeler, auditor, simplifier, orchestrator. Only the matching subtype may perform its actions.
; - The process is strictly sequential: modeling (p1) -> audit (p2) -> simplification/mapping (p3) -> integration (p4).
;   Sequence is enforced by an explicit current-phase predicate plus a static successor relation phase-succ.
; - No bookkeeping shortcuts, penalties, or post-hoc fixes are permitted. Each required fact is produced by a corresponding action.
; - All natural-language preferences (e.g., ordering) are encoded as hard constraints (preconditions) so violating plans are impossible.
; - No resources, connectivity, or availability beyond agents, one artifact, and four explicit phases are assumed.

(define (domain orchestration)
  :requirements :strips :typing :negative-preconditions
  :types
    agent
    modeler auditor simplifier orchestrator - agent
    artifact
    phase

  :predicates
    ;; core artifact state
    (artifact-created ?a - artifact)
    (artifact-reviewed ?a - artifact)        ; auditor has completed corrections review
    (artifact-mapped ?a - artifact)          ; simplifier has produced canonical mapping for the artifact
    (artifact-integrated ?a - artifact)      ; orchestrator has produced integrated artifact

    ;; provenance / actor-recording
    (owns ?ag - agent ?a - artifact)         ; actor who created the artifact
    (reviewed-by ?a - artifact ?ag - agent)
    (mapped-by ?a - artifact ?ag - agent)
    (integrated-by ?a - artifact ?ag - agent)

    ;; phase sequencing and control
    (phase-done ?p - phase)
    (phase-succ ?p1 - phase ?p2 - phase)     ; static successor relation, set in problem init
    (current-phase ?p - phase)

  ; Action: Modeler creates the symbolic model in phase p1 and advances the phase to p2.
  (:action create-model
    :parameters (?m - modeler ?a - artifact ?p1 - phase ?p2 - phase)
    :precondition (and
                    (current-phase ?p1)
                    (phase-succ ?p1 ?p2)
                    (not (artifact-created ?a))
                  )
    :effect (and
              (artifact-created ?a)
              (owns ?m ?a)
              (phase-done ?p1)
              (not (current-phase ?p1))
              (current-phase ?p2)
            )
  )

  ; Action: Auditor reviews the created artifact in the audit phase and advances to the next phase.
  ; Auditor is required to mark the artifact-reviewed fact; this is distinct from mapping.
  (:action audit-artifact
    :parameters (?aud - auditor ?a - artifact ?p2 - phase ?p3 - phase)
    :precondition (and
                    (current-phase ?p2)
                    (phase-succ ?p2 ?p3)
                    (artifact-created ?a)
                    (not (artifact-reviewed ?a))
                  )
    :effect (and
              (artifact-reviewed ?a)
              (reviewed-by ?a ?aud)
              (phase-done ?p2)
              (not (current-phase ?p2))
              (current-phase ?p3)
            )
  )

  ; Action: Simplifier produces canonical mapping for the audited artifact, only after audit is complete.
  (:action simplify-map
    :parameters (?s - simplifier ?a - artifact ?p3 - phase ?p4 - phase)
    :precondition (and
                    (current-phase ?p3)
                    (phase-succ ?p3 ?p4)
                    (artifact-reviewed ?a)
                    (not (artifact-mapped ?a))
                  )
    :effect (and
              (artifact-mapped ?a)
              (mapped-by ?a ?s)
              (phase-done ?p3)
              (not (current-phase ?p3))
              (current-phase ?p4)
            )
  )

  ; Action: Orchestrator integrates the created, reviewed, and mapped artifact into the final integrated artifact.
  ; Integration requires all prior facts and advances final phase p4 is completed (no further phase).
  (:action integrate-artifact
    :parameters (?o - orchestrator ?a - artifact ?p4 - phase)
    :precondition (and
                    (current-phase ?p4)
                    (artifact-created ?a)
                    (artifact-reviewed ?a)
                    (artifact-mapped ?a)
                    (not (artifact-integrated ?a))
                  )
    :effect (and
              (artifact-integrated ?a)
              (integrated-by ?a ?o)
              (phase-done ?p4)
              (not (current-phase ?p4))
            )
  )
)