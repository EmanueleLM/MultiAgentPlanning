(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent analyst auditor orchestrator task dataset report phase)

  (:predicates
    (assigned ?t - task ?a - analyst)                     ; task assigned to analyst
    (requires ?t - task ?d - dataset)                     ; task requires dataset
    (data-available ?d - dataset ?p - phase)              ; dataset available in phase
    (current-phase ?p - phase)                            ; currently active phase
    (successor ?p1 - phase ?p2 - phase)                   ; phase p2 follows p1 (contiguity)
    (model-built ?a - analyst ?t - task)                  ; analyst built model for task
    (report-for ?r - report ?t - task)                    ; report corresponds to task
    (report-owned-by ?r - report ?a - analyst)            ; report draft/owner (analyst)
    (report-generated ?r - report ?t - task)              ; report produced for task
    (prepared-for-audit ?r - report)                      ; report ready for audit
    (assigned-auditor ?r - report ?aud - auditor)         ; report assigned to auditor
    (audit-performed ?aud - auditor ?r - report)          ; auditor performed review on report
    (report-reviewed ?r - report)                         ; report has been reviewed
    (approved ?r - report)                                ; report approved by auditor
    (completed ?t - task)                                 ; task marked completed
  )

  ; Analyst builds a model for a task when the required dataset is available in the current phase.
  (:action analyst-build-model
    :parameters (?a - analyst ?t - task ?d - dataset ?p - phase)
    :precondition (and
                    (assigned ?t ?a)
                    (requires ?t ?d)
                    (data-available ?d ?p)
                    (current-phase ?p)
                    (not (model-built ?a ?t))
                  )
    :effect (and
              (model-built ?a ?t)
            )
  )

  ; Analyst generates the report corresponding to a specific task after building the model.
  (:action analyst-generate-report
    :parameters (?a - analyst ?t - task ?r - report ?p - phase)
    :precondition (and
                    (model-built ?a ?t)
                    (report-for ?r ?t)
                    (report-owned-by ?r ?a)
                    (current-phase ?p)
                    (not (report-generated ?r ?t))
                  )
    :effect (and
              (report-generated ?r ?t)
              (prepared-for-audit ?r)
            )
  )

  ; Auditor reviews and approves a prepared report. Approval is mandatory before a task can be completed.
  (:action auditor-review-report
    :parameters (?aud - auditor ?r - report ?p - phase)
    :precondition (and
                    (assigned-auditor ?r ?aud)
                    (prepared-for-audit ?r)
                    (current-phase ?p)
                    (not (audit-performed ?aud ?r))
                  )
    :effect (and
              (audit-performed ?aud ?r)
              (report-reviewed ?r)
              (approved ?r)
            )
  )

  ; Analyst marks a task completed only after its model is built and its report is generated and approved.
  (:action analyst-mark-completed
    :parameters (?a - analyst ?t - task ?r - report ?p - phase)
    :precondition (and
                    (assigned ?t ?a)
                    (model-built ?a ?t)
                    (report-for ?r ?t)
                    (report-generated ?r ?t)
                    (approved ?r)
                    (current-phase ?p)
                    (not (completed ?t))
                  )
    :effect (and
              (completed ?t)
            )
  )

  ; Orchestrator advances the global phase, must follow successor links to enforce contiguity and order.
  (:action orchestrator-advance-phase
    :parameters (?o - orchestrator ?p1 - phase ?p2 - phase)
    :precondition (and
                    (current-phase ?p1)
                    (successor ?p1 ?p2)
                  )
    :effect (and
              (not (current-phase ?p1))
              (current-phase ?p2)
            )
  )

)