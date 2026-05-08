(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task info)

  ; Domain-level typed constants (explicit tokens required by specification)
  (:constants
    orchestrator analyst auditor - agent
    paltry sip clip wretched memory tightfisted objects - task
    analysis-report audit-report public-info private-info global-goal - info
  )

  (:predicates
    ; agent possesses an information artifact
    (has ?a - agent ?i - info)
    ; a named task step has been completed
    (step-done ?t - task)
    ; final integrated product is produced by the agent
    (integrated ?a - agent)
    ; agent is available to perform steps
    (available ?a - agent)
  )

  ; The workflow enforces a strict sequence: paltry -> sip -> clip -> wretched -> memory -> tightfisted -> objects
  ; Each action can be executed only once (negative precondition on step-done for that task),
  ; and only after its predecessor's step-done holds. All actions require the orchestrator to be available.

  (:action paltry
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
    :precondition (and
                    (available orchestrator)
                    (step-done memory)
                    ; encoding a strict constraint: this step requires continued access to both the analysis and audit artifacts
                    (has orchestrator analysis-report)
                    (has orchestrator audit-report)
                    (not (step-done tightfisted))
                  )
    :effect (and
              (step-done tightfisted)
            )
  )

  ; Finalizing action: requires all prior steps completed; marks final task done and produces integrated product.
  (:action objects
    :precondition (and
                    (available orchestrator)
                    (step-done paltry)
                    (step-done sip)
                    (step-done clip)
                    (step-done wretched)
                    (step-done memory)
                    (step-done tightfisted)
                    (not (step-done objects))
                  )
    :effect (and
              (step-done objects)
              (integrated orchestrator)
            )
  )
)