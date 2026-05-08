(define (domain orchestrator-domain)
  (:requirements :typing :negative-preconditions)
  (:types agent task info)
  (:constants
    orchestrator analyst auditor - agent
    paltry sip clip wretched memory tightfisted objects_task - task
    analysis-report audit-report public-info private-info global-goal - info
  )
  (:predicates
    (has ?a - agent ?i - info)
    (step-done ?t - task)
    (integrated ?a - agent)
    (available ?a - agent)
  )

  (:action paltry
    :parameters ()
    :precondition (and
      (available orchestrator)
      (has orchestrator analysis-report)
      (not (step-done paltry))
    )
    :effect (and
      (step-done paltry)
    )
  )

  (:action sip
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done paltry)
      (has orchestrator audit-report)
      (not (step-done sip))
    )
    :effect (and
      (step-done sip)
    )
  )

  (:action clip
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done sip)
      (has orchestrator public-info)
      (not (step-done clip))
    )
    :effect (and
      (step-done clip)
    )
  )

  (:action wretched
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done clip)
      (has orchestrator private-info)
      (not (step-done wretched))
    )
    :effect (and
      (step-done wretched)
    )
  )

  (:action memory
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done wretched)
      (has orchestrator global-goal)
      (not (step-done memory))
    )
    :effect (and
      (step-done memory)
    )
  )

  (:action tightfisted
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done memory)
      (has orchestrator analysis-report)
      (has orchestrator audit-report)
      (not (step-done tightfisted))
    )
    :effect (and
      (step-done tightfisted)
    )
  )

  (:action objects
    :parameters ()
    :precondition (and
      (available orchestrator)
      (step-done paltry)
      (step-done sip)
      (step-done clip)
      (step-done wretched)
      (step-done memory)
      (step-done tightfisted)
      (not (step-done objects_task))
    )
    :effect (and
      (step-done objects_task)
      (integrated orchestrator)
    )
  )
)