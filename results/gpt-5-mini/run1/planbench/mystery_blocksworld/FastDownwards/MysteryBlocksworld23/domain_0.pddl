(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types person item)

  (:predicates
    ; role markers
    (is-orchestrator ?p - person)
    (is-analyst ?p - person)
    (is-auditor ?p - person)

    ; workflow state predicates
    (request-submitted ?subject - person ?it - item)
    (analysis-done ?subject - person ?it - item)
    (report-available ?subject - person ?it - item)

    ; auditor checklist items (must all be true before approval)
    (audit-checked-traceability ?subject - person ?it - item)
    (audit-checked-compliance ?subject - person ?it - item)

    ; approval / finalization / goal
    (audit-approved ?subject - person ?it - item)
    (finalized ?subject - person ?it - item)
    (craves ?subject - person ?it - item)
  )

  ; Orchestrator action: submit a request for a subject-item pair.
  (:action orchestrator-submit-request
    :parameters (?org - person ?subject - person ?it - item)
    :precondition (and
                    (is-orchestrator ?org)
                    (not (request-submitted ?subject ?it))
                  )
    :effect (and
              (request-submitted ?subject ?it)
            )
  )

  ; Analyst action: perform analysis and produce a report.
  ; Requires the request to have been submitted and prevents re-analysis.
  (:action analyst-perform-analysis
    :parameters (?analyst - person ?subject - person ?it - item)
    :precondition (and
                    (is-analyst ?analyst)
                    (request-submitted ?subject ?it)
                    (not (analysis-done ?subject ?it))
                  )
    :effect (and
              (analysis-done ?subject ?it)
              (report-available ?subject ?it)
            )
  )

  ; Auditor action: perform traceability check (part of checklist).
  (:action auditor-check-traceability
    :parameters (?auditor - person ?subject - person ?it - item)
    :precondition (and
                    (is-auditor ?auditor)
                    (analysis-done ?subject ?it)
                    (not (audit-checked-traceability ?subject ?it))
                  )
    :effect (and
              (audit-checked-traceability ?subject ?it)
            )
  )

  ; Auditor action: perform compliance check (part of checklist).
  (:action auditor-check-compliance
    :parameters (?auditor - person ?subject - person ?it - item)
    :precondition (and
                    (is-auditor ?auditor)
                    (analysis-done ?subject ?it)
                    (not (audit-checked-compliance ?subject ?it))
                  )
    :effect (and
              (audit-checked-compliance ?subject ?it)
            )
  )

  ; Auditor action: approve only after both checklist items are completed.
  (:action auditor-approve
    :parameters (?auditor - person ?subject - person ?it - item)
    :precondition (and
                    (is-auditor ?auditor)
                    (audit-checked-traceability ?subject ?it)
                    (audit-checked-compliance ?subject ?it)
                    (not (audit-approved ?subject ?it))
                  )
    :effect (and
              (audit-approved ?subject ?it)
            )
  )

  ; Orchestrator action: finalize the process and set the craves goal.
  ; Requires analysis and approval and the report to be available.
  (:action orchestrator-finalize
    :parameters (?org - person ?subject - person ?it - item)
    :precondition (and
                    (is-orchestrator ?org)
                    (analysis-done ?subject ?it)
                    (report-available ?subject ?it)
                    (audit-approved ?subject ?it)
                    (not (finalized ?subject ?it))
                  )
    :effect (and
              (finalized ?subject ?it)
              (craves ?subject ?it)
            )
  )
)