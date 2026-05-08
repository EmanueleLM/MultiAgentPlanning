(define (problem integrate-analyses-problem)
  (:domain analysis-integration)

  ; Objects mirroring domain constants to make the problem self-contained and explicit.
  (:objects
    agent_a agent_b client - agent
    auditor1 - auditor
    analysis1 analysis2 - analysis
    audit_report - document
    integrated_doc - document
    phase_produce phase_audit phase_integrate phase_deliver - phase
  )

  (:init
    ; Initial phase: produce phase must be current.
    (current-phase phase_produce)

    ; Phase ordering for clarity (optional informational facts)
    (phase-succ phase_produce phase_audit)
    (phase-succ phase_audit phase_integrate)
    (phase-succ phase_integrate phase_deliver)

    ; No analyses produced/reviewed/audited/integrated/delivered initially.
    ; (The absence of those predicates is implicit; listed here only for clarity if needed.)
    ; (Not listing them here keeps the initial state minimal and consistent with STRIPS assumptions.)
  )

  ; Goal: final terminal conditions fixed explicitly:
  ; - integrated_doc exists as the integrated document,
  ; - integrated_doc was integrated from both analyses,
  ; - both analyses retain provenance (produced-by correct agent),
  ; - both analyses were reviewed and linked to the audit report produced by the auditor,
  ; - audit report links to both analyses,
  ; - integrated_doc has been delivered to the specified client.
  (:goal (and
    ; analyses produced with preserved provenance
    (analysis-produced analysis1)
    (produced-by analysis1 agent_a)
    (analysis-produced analysis2)
    (produced-by analysis2 agent_b)

    ; analyses reviewed and reviewed-by provenance
    (analysis-reviewed analysis1)
    (reviewed-by analysis1 auditor1)
    (analysis-reviewed analysis2)
    (reviewed-by analysis2 auditor1)

    ; audited report exists and links to both analyses
    (audited-report audit_report)
    (audit-linked audit_report analysis1)
    (audit-linked audit_report analysis2)

    ; integrated document and its provenance
    (integrated-document integrated_doc)
    (integrated-from integrated_doc analysis1)
    (integrated-from integrated_doc analysis2)

    ; delivered to the required recipient
    (delivered integrated_doc)
    (delivered-to integrated_doc client)

    ; final phase must be the delivery phase (enforce terminal phase)
    (current-phase phase_deliver)
  ))
)