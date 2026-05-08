(define (problem workflow-orchestration-problem)
  (:domain workflow-orchestration)
  (:objects
    observer1 - agent
    reasoner1 - agent
    auditor1 - agent

    d1 d2 - data

    p1 p2 - plan

    ph0 ph1 ph2 ph3 ph4 ph5 ph6 - phase
  )

  (:init
    (observer-assigned observer1)
    (reasoner-assigned reasoner1)
    (auditor-assigned auditor1)

    (data-exists d1)
    (data-exists d2)

    (plan-slot p1 d1)
    (plan-slot p2 d2)

    (phase-successor ph0 ph1)
    (phase-successor ph1 ph2)
    (phase-successor ph2 ph3)
    (phase-successor ph3 ph4)
    (phase-successor ph4 ph5)
    (phase-successor ph5 ph6)

    (phase-completed ph0 d1)
    (phase-completed ph0 d2)
  )

  (:goal (and
    (collected d1)
    (analyzed d1)
    (plan-generated p1 d1)
    (plan-reviewed p1 d1)
    (remediation-applied p1 d1)
    (verified d1 p1)
    (phase-completed ph6 d1)

    (collected d2)
    (analyzed d2)
    (plan-generated p2 d2)
    (plan-reviewed p2 d2)
    (remediation-applied p2 d2)
    (verified d2 p2)
    (phase-completed ph6 d2)
  ))
)