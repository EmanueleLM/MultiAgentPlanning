(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    player_agent assistant_agent auditor_agent human_agent - agent
    rule1 rule2 - rule
    report1 report2 - report
  )

  (:init
    ;; Public initial facts:
    ;; Rule1 already observed, normalized, has a created report that is audited, approved, and implemented.
    (observed rule1)
    (normalized rule1)
    (report-created report1)
    (report-for report1 rule1)
    (audited report1)
    (approved report1)
    (implemented rule1)

    ;; Rule2 has been observed (publicly known) but steps after observation remain to be done.
    (observed rule2)

    ;; No other facts are true initially (report2 is not created, not audited, etc.).
  )

  ;; Human goal: every mandated terminal condition must be fixed explicitly.
  ;; Enforce that both rules are implemented and that both reports exist, are audited and approved.
  (:goal
    (and
      ;; final task completion for both rules
      (implemented rule1)
      (implemented rule2)

      ;; reports for both rules must exist and be audited and approved
      (report-created report1)
      (report-for report1 rule1)
      (audited report1)
      (approved report1)

      (report-created report2)
      (report-for report2 rule2)
      (audited report2)
      (approved report2)
    )
  )
)