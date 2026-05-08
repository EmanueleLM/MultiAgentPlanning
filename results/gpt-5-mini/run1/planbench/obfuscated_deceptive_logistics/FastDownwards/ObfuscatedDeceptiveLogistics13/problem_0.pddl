(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    ;; Agents
    player assistant auditor - agent

    ;; Items / artifacts
    obs1 rules1 report1 - item

    ;; Phases (explicit sequence)
    p1 p2 p3 p4 - phase
  )

  (:init
    ;; Agents
    (is-agent player)
    (is-agent assistant)
    (is-agent auditor)

    ;; Initial phase is p1
    (at-phase p1)

    ;; Phase successor links: enforce contiguous progression p1 -> p2 -> p3 -> p4
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)

    ;; Initially nothing collected/normalized/audited/generated/approved/published
    ;; (All such predicates must be achieved by actions.)
    ;; Note: negative-preconditions in actions prevent repeated or out-of-order effects.

    ;; For clarity, no artifact predicates are true initially.
    ;; (No explicit negative facts; just absence of positives.)
  )

  ;; Goal: the human (player) mandates a published, approved final report,
  ;; and all upstream artifacts and phase must be completed and the system reached final phase p4.
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