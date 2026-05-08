(define (domain orchestrated-tasks)
  :requirements :strips :typing :negative-preconditions
  :types agent task phase obj location

  :constants
    paltry sip clip wretched memory tightfisted - task
    objects - obj
    analyst auditor orchestrator - agent
    analysis-phase audit-phase execution-phase - phase
    locA locB locGoal - location

  :predicates
    (at ?ag - agent ?l - location)
    (at-obj ?o - obj ?l - location)
    (task-done ?t - task)
    (phase-done ?p - phase)
  ;; Actions representing the named tasks. Each action is agent-specific and
  ;; enforces phase ordering by requiring completion of prior phases when needed.
  (:action paltry
    :precondition (and
      (not (task-done paltry))
      ;; analyst must be present where the object initially is
      (at analyst locA)
      ;; paltry belongs to the analysis phase (no prior phase required)
    )
    :effect (and
      (task-done paltry)
    )
  )

  (:action sip
    :precondition (and
      (not (task-done sip))
      (at analyst locA)
    )
    :effect (and
      (task-done sip)
    )
  )

  ;; Finishing analysis phase is an explicit action that can only occur after both tasks in that phase are done.
  (:action finish-analysis-phase
    :precondition (and
      (task-done paltry)
      (task-done sip)
      (not (phase-done analysis-phase))
    )
    :effect (and
      (phase-done analysis-phase)
    )
  )

  (:action clip
    :precondition (and
      (not (task-done clip))
      ;; audit tasks require analysis phase finished
      (phase-done analysis-phase)
      (at auditor locB)
    )
    :effect (and
      (task-done clip)
    )
  )

  (:action wretched
    :precondition (and
      (not (task-done wretched))
      (phase-done analysis-phase)
      (at auditor locB)
    )
    :effect (and
      (task-done wretched)
    )
  )

  (:action finish-audit-phase
    :precondition (and
      (task-done clip)
      (task-done wretched)
      (phase-done analysis-phase)
      (not (phase-done audit-phase))
    )
    :effect (and
      (phase-done audit-phase)
    )
  )

  ;; Execution-phase tasks (performed by the orchestrator). 'memory' is responsible for moving the object to the final location.
  (:action memory
    :precondition (and
      (not (task-done memory))
      (phase-done audit-phase)
      (at orchestrator locB)
      (at-obj objects locA)    ;; requires the object to be at the start location
    )
    :effect (and
      (task-done memory)
      ;; physically move the object to the goal location as part of this task
      (not (at-obj objects locA))
      (at-obj objects locGoal)
    )
  )

  (:action tightfisted
    :precondition (and
      (not (task-done tightfisted))
      (phase-done audit-phase)
      (at orchestrator locB)
    )
    :effect (and
      (task-done tightfisted)
    )
  )

  (:action finish-execution-phase
    :precondition (and
      (task-done memory)
      (task-done tightfisted)
      (phase-done audit-phase)
      (not (phase-done execution-phase))
    )
    :effect (and
      (phase-done execution-phase)
    )
  )
)