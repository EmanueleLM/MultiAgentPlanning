(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    player assistant auditor - agent
    obs1 rules1 report1 - item
    p1 p2 p3 p4 - phase
  )

  (:init
    (is-agent player)
    (is-agent assistant)
    (is-agent auditor)
    (at-phase p1)
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)
  )

  (:goal (and
            (obs-collected obs1)
            (rules-normalized rules1)
            (audit-completed rules1)
            (report-generated report1)
            (approved report1)
            (published report1)
            (at-phase p4)
         ))
)