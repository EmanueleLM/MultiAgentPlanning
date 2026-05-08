(define (problem orchestration-problem)
  (:domain orchestration-domain)

  (:objects
    org - person
    ana - person
    aud - person
    b   - person
    d   - item
  )

  (:init
    ; assign roles
    (is-orchestrator org)
    (is-analyst ana)
    (is-auditor aud)

    ; No workflow facts present initially: request not submitted, analysis not done, checks not performed, not approved, not finalized.
    ; Everything needed to reach the goal must be produced by actions.
  )

  ; Goal fixes all mandated terminal conditions: the subject b must crave item d,
  ; the analysis must be done, the audit must be approved, and the workflow finalized with the report available.
  (:goal
    (and
      (craves b d)
      (analysis-done b d)
      (report-available b d)
      (audit-approved b d)
      (finalized b d)
    )
  )
)