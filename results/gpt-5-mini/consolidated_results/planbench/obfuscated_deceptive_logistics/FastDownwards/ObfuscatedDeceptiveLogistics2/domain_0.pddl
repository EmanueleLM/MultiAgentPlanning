(define (domain orchestration-domain)
  ;; Domain for a four-step orchestrated workflow:
  ;; analysis -> proposal -> audit -> integration
  ;; Contributors: analyzer model, proposer fragments, auditor corrections
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task day)

  ;; Predicates
  (:predicates
    (can-perform ?ag - agent ?t - task)         ; which agent can perform which task
    (is-day ?d - day)                           ; day objects
    (day-first ?d - day)                        ; first day marker
    (day-successor ?d1 - day ?d2 - day)         ; successor relation enforcing contiguity
    (completed ?t - task)                       ; task completed
    (completed-on ?t - task ?d - day)           ; task completed on a particular day
    (proposal-corrected)                        ; auditor has corrected/approved proposal
    (finalized)                                 ; final integration completed
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Analyzer fragment contributed by analyzer model
  (:action perform-analyze
    :parameters (?ag - agent ?d - day ?t - task)
    :precondition (and
      (can-perform ?ag ?t)
      (is-day ?d)
      (day-first ?d)
      (not (completed ?t))
    )
    :effect (and
      (completed ?t)
      (completed-on ?t ?d)
    )
  )

  ;; Proposer fragment contributed by proposer agent
  ;; Note: must execute on the day that is the successor of the analysis day.
  (:action perform-propose
    :parameters (?ag - agent ?d1 - day ?d2 - day ?t1 - task ?t2 - task)
    :precondition (and
      (can-perform ?ag ?t2)
      (is-day ?d1)
      (is-day ?d2)
      (day-successor ?d1 ?d2)
      (completed-on ?t1 ?d1)    ; proposal requires analyze completed on predecessor day
      (not (completed ?t2))
    )
    :effect (and
      (completed ?t2)
      (completed-on ?t2 ?d2)
    )
  )

  ;; Auditor fragment contributed by auditor corrections
  ;; Auditor must audit on the successor day after proposal; auditing sets proposal-corrected.
  (:action audit-proposal
    :parameters (?ag - agent ?d2 - day ?d3 - day ?t-prop - task ?t-audit - task)
    :precondition (and
      (can-perform ?ag ?t-audit)
      (is-day ?d2)
      (is-day ?d3)
      (day-successor ?d2 ?d3)
      (completed-on ?t-prop ?d2)   ; proposal must have been completed on predecessor day
      (not (completed ?t-audit))
    )
    :effect (and
      (completed ?t-audit)
      (completed-on ?t-audit ?d3)
      (proposal-corrected)
    )
  )

  ;; Integrator action (could be performed by proposer or a dedicated integrator)
  ;; Integration must occur on the successor day after audit and requires proposal-corrected.
  (:action perform-integration
    :parameters (?ag - agent ?d3 - day ?d4 - day ?t-audit - task ?t-int - task)
    :precondition (and
      (can-perform ?ag ?t-int)
      (is-day ?d3)
      (is-day ?d4)
      (day-successor ?d3 ?d4)
      (completed-on ?t-audit ?d3)
      (proposal-corrected)
      (not (completed ?t-int))
    )
    :effect (and
      (completed ?t-int)
      (completed-on ?t-int ?d4)
      (finalized)
    )
  )

)