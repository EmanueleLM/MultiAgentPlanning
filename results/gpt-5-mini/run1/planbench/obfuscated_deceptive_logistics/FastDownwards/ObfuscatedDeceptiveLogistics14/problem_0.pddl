(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ; No additional object declarations here: the necessary typed constants are declared in the domain.
  ; Initial facts come from the orchestrator having received the analyst analysis, the auditor audit report,
  ; public information, private information, and the global goal — as required by the specification.

  (:init
    (available orchestrator)
    (has orchestrator analysis-report)
    (has orchestrator audit-report)
    (has orchestrator public-info)
    (has orchestrator private-info)
    (has orchestrator global-goal)
    ; agents analyst and auditor exist as domain constants (no additional init facts required for them)
  )

  ; Goal: every mandated terminal condition is fixed explicitly.
  ; All named task steps must be completed and the orchestrator must have produced the integrated product.
  (:goal (and
           (step-done paltry)
           (step-done sip)
           (step-done clip)
           (step-done wretched)
           (step-done memory)
           (step-done tightfisted)
           (step-done objects)
           (integrated orchestrator)
         )
  )
)