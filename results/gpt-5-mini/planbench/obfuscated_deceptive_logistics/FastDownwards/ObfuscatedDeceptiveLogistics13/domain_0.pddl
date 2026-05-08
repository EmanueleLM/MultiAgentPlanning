(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent rule report)

  (:predicates
    ;; Observations and intermediate artifacts
    (observed ?r - rule)
    (normalized ?r - rule)
    (report-created ?rep - report)
    (report-for ?rep - report ?r - rule)
    (audited ?rep - report)
    (approved ?rep - report)
    (implemented ?r - rule)

    ;; Lock used to enforce ordering: once audited, rule cannot be re-normalized
    (locked ?r - rule)
  )

  ;; Actions are explicitly prefixed by the originating agent
  (:action player_observe
    :parameters (?r - rule)
    :precondition (not (observed ?r))
    :effect (observed ?r)
  )

  (:action assistant_normalize
    :parameters (?r - rule)
    :precondition (and (observed ?r) (not (normalized ?r)) (not (locked ?r)))
    :effect (normalized ?r)
  )

  (:action assistant_create-report
    :parameters (?rep - report ?r - rule)
    :precondition (and (normalized ?r) (not (report-created ?rep)))
    :effect (and (report-created ?rep) (report-for ?rep ?r))
  )

  (:action auditor_audit-report
    :parameters (?rep - report ?r - rule)
    :precondition (and (report-created ?rep) (report-for ?rep ?r) (not (audited ?rep)))
    :effect (and (audited ?rep) (locked ?r))
  )

  (:action human_approve-report
    :parameters (?rep - report ?r - rule)
    :precondition (and (audited ?rep) (report-for ?rep ?r) (not (approved ?rep)))
    :effect (approved ?rep)
  )

  (:action assistant_implement-rule
    :parameters (?rep - report ?r - rule)
    :precondition (and (approved ?rep) (report-for ?rep ?r) (not (implemented ?r)))
    :effect (implemented ?r)
  )
)