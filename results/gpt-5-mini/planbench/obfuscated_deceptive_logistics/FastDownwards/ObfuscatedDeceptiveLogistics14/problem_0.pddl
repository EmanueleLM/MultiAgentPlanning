(define (problem orchestrated-problem)
  (:domain orchestrated-tasks)
  (:objects
    ;; All typed objects are also declared here for clarity (domain has the same constants).
    paltry sip clip wretched memory tightfisted - task
    objects - obj
    analyst auditor orchestrator - agent
    analysis-phase audit-phase execution-phase - phase
    locA locB locGoal - location
  )
  (:init
    ;; Initial agent locations (match action preconditions)
    (at analyst locA)
    (at auditor locB)
    (at orchestrator locB)

    ;; Initial object location
    (at-obj objects locA)

    ;; No tasks or phases are done initially: absence of (task-done ...) and (phase-done ...)
    ;; (negative preconditions in actions will check these absences explicitly)
  )
  (:goal
    (and
      ;; All named tasks must be completed
      (task-done paltry)
      (task-done sip)
      (task-done clip)
      (task-done wretched)
      (task-done memory)
      (task-done tightfisted)

      ;; All phases must be explicitly finished in order (finish actions enforce ordering)
      (phase-done analysis-phase)
      (phase-done audit-phase)
      (phase-done execution-phase)

      ;; The object must end up at the mandated final location
      (at-obj objects locGoal)
    )
  )
)