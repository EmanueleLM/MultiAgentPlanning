(define (problem workflow-orchestration-problem)
  (:domain workflow-orchestration)
  (:objects
    ;; agents
    observer1 - agent
    reasoner1 - agent
    auditor1 - agent

    ;; data items
    d1 d2 - data

    ;; plan artifacts (each assigned to a specific data item via plan-slot)
    p1 p2 - plan

    ;; explicit phases to enforce ordering
    ph0 ph1 ph2 ph3 ph4 ph5 ph6 - phase
  )

  (:init
    ;; agent assignments (must be explicit; agents are available and assigned for their roles)
    (observer-assigned observer1)
    (reasoner-assigned reasoner1)
    (auditor-assigned auditor1)

    ;; data exists and must be processed
    (data-exists d1)
    (data-exists d2)

    ;; mapping from plan objects to the data they correspond to (static)
    (plan-slot p1 d1)
    (plan-slot p2 d2)

    ;; phase successor relations (static chain)
    (phase-successor ph0 ph1)
    (phase-successor ph1 ph2)
    (phase-successor ph2 ph3)
    (phase-successor ph3 ph4)
    (phase-successor ph4 ph5)
    (phase-successor ph5 ph6)

    ;; starting condition: ph0 considered completed for all data items (enables first phase)
    (phase-completed ph0 d1)
    (phase-completed ph0 d2)
  )

  ;; Terminal conditions: for each data item the full ordered workflow must have completed
  (:goal (and
    ;; For d1
    (collected d1)
    (analyzed d1)
    (plan-generated p1 d1)
    (plan-reviewed p1 d1)
    (remediation-applied p1 d1)
    (verified d1 p1)
    (phase-completed ph6 d1)

    ;; For d2
    (collected d2)
    (analyzed d2)
    (plan-generated p2 d2)
    (plan-reviewed p2 d2)
    (remediation-applied p2 d2)
    (verified d2 p2)
    (phase-completed ph6 d2)
  ))
)