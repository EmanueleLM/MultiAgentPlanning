(define (domain analysis-integration)
  ; Domain: analysis-integration
  ; Modeling decisions:
  ; - Agents, analyses, auditor, documents, and phases are modeled as typed objects declared as domain constants
  ;   so action schemas can refer to concrete actor identities and thus preserve provenance in effects.
  ; - Phases are explicit objects (phase_produce -> phase_audit -> phase_integrate -> phase_deliver).
  ;   Every action requires a specific current-phase predicate to enforce ordering and prevent reordering.
  ; - No bookkeeping shortcuts (no penalties, tokens, or "fix later" actions). Integration and delivery
  ;   are only possible once the required prior facts (produced/reviewed/audit) exist.
  ; - Provenance is explicit: produced-by, reviewed-by, audit-linked, integrated-from, delivered-to.
  ; - All actions are STRIPS-style; removals use negative preconditions to ensure state-checks.
  (:requirements :strips :typing :negative-preconditions)

  (:types agent auditor analysis document phase)

  ; Domain-level constants: concrete named agents, analyses, documents and phases.
  ; These constants are mirrored as objects in the problem; declaring them here allows action definitions
  ; to mention them explicitly so effects preserve provenance clearly.
  (:constants
    agent_a agent_b client - agent
    auditor1 - auditor
    analysis1 analysis2 - analysis
    audit_report - document
    integrated_doc - document
    phase_produce phase_audit phase_integrate phase_deliver - phase
  )

  (:predicates
    ; Current active phase (exactly one of these will hold initially and transitions are used to advance)
    (current-phase ?p - phase)

    ; Phase ordering (informational; not strictly required by planner but included for clarity)
    (phase-succ ?p1 - phase ?p2 - phase)

    ; Analyses produced and provenance
    (analysis-produced ?an - analysis)
    (produced-by ?an - analysis ?ag - agent)

    ; Analyses reviewed by auditor and provenance
    (analysis-reviewed ?an - analysis)
    (reviewed-by ?an - auditor)

    ; Auditor produces an audit report that links to analyses
    (audited-report ?r - document)
    (audit-linked ?r - document ?an - analysis)

    ; Integration result and provenance
    (integrated-document ?d - document)
    (integrated-from ?d - analysis)

    ; Delivery status and recipient provenance
    (delivered ?d - document)
    (delivered-to ?d - agent)
  )

  ; ACTIONS
  ; Producing analyses: distinct actions per producing agent to preserve provenance in action names and effects.

  (:action produce-analysis-by-agent-a
    :parameters ()
    :precondition (and
      (current-phase phase_produce)
      (not (analysis-produced analysis1))
    )
    :effect (and
      (analysis-produced analysis1)
      (produced-by analysis1 agent_a)
    )
  )

  (:action produce-analysis-by-agent-b
    :parameters ()
    :precondition (and
      (current-phase phase_produce)
      (not (analysis-produced analysis2))
    )
    :effect (and
      (analysis-produced analysis2)
      (produced-by analysis2 agent_b)
    )
  )

  ; Advance from produce to audit only when both analyses are produced.
  (:action advance-to-audit
    :parameters ()
    :precondition (and
      (current-phase phase_produce)
      (analysis-produced analysis1)
      (analysis-produced analysis2)
    )
    :effect (and
      (not (current-phase phase_produce))
      (current-phase phase_audit)
    )
  )

  ; Auditor reviews both analyses and produces an audit report.
  ; The auditor-review action preserves provenance: reviewed-by and audit-linked relations.
  (:action auditor-review-both
    :parameters ()
    :precondition (and
      (current-phase phase_audit)
      (analysis-produced analysis1)
      (analysis-produced analysis2)
      (not (analysis-reviewed analysis1))
      (not (analysis-reviewed analysis2))
    )
    :effect (and
      ; mark reviews and provenance
      (analysis-reviewed analysis1)
      (reviewed-by analysis1 auditor1)
      (analysis-reviewed analysis2)
      (reviewed-by analysis2 auditor1)

      ; create audit report and link it to analyses
      (audited-report audit_report)
      (audit-linked audit_report analysis1)
      (audit-linked audit_report analysis2)

      ; advance to integrate phase
      (not (current-phase phase_audit))
      (current-phase phase_integrate)
    )
  )

  ; Integrate reviewed analyses into a single integrated document.
  (:action integrate-reviewed-analyses
    :parameters ()
    :precondition (and
      (current-phase phase_integrate)
      (audited-report audit_report)
      (analysis-reviewed analysis1)
      (analysis-reviewed analysis2)
      (not (integrated-document integrated_doc))
    )
    :effect (and
      (integrated-document integrated_doc)
      (integrated-from integrated_doc analysis1)
      (integrated-from integrated_doc analysis2)

      ; advance to deliver phase
      (not (current-phase phase_integrate))
      (current-phase phase_deliver)
    )
  )

  ; Deliver integrated document to the client. Delivery is final.
  (:action deliver-integrated-document
    :parameters ()
    :precondition (and
      (current-phase phase_deliver)
      (integrated-document integrated_doc)
      (not (delivered integrated_doc))
    )
    :effect (and
      (delivered integrated_doc)
      (delivered-to integrated_doc client)
      ; phase remains phase_deliver to indicate terminal delivery phase (no back transitions allowed)
      (current-phase phase_deliver)
    )
  )
)