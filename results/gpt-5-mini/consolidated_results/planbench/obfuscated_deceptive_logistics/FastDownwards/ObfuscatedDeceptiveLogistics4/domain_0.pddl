(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item location phase)

  (:predicates
    (current-phase ?p - phase)
    (next ?p - phase ?q - phase)
    (is-describe-phase ?p - phase)
    (is-move-phase ?p - phase)
    (is-audit-phase ?p - phase)
    (is-repair-phase ?p - phase)

    (role-describer ?a - agent)
    (role-manipulator ?a - agent)
    (role-auditor ?a - agent)

    (at ?i - item ?l - location)
    (described ?i - item)
    (audited ?i - item)
    (needs-repair ?i - item)
    (repaired ?i - item)

    (is-final-location ?l - location)
  )

  ;; Describer action: must be performed by an agent with describer role
  ;; and only during a phase marked as the describe phase and when that phase is current.
  (:action describer_describe
    :parameters (?d - agent ?it - item ?p - phase)
    :precondition (and
                    (role-describer ?d)
                    (is-describe-phase ?p)
                    (current-phase ?p)
                    (not (described ?it))
                  )
    :effect (and
              (described ?it)
            )
  )

  ;; Manipulator moves an item between two locations during the move phase.
  (:action manipulator_move
    :parameters (?m - agent ?it - item ?from - location ?to - location ?p - phase)
    :precondition (and
                    (role-manipulator ?m)
                    (is-move-phase ?p)
                    (current-phase ?p)
                    (described ?it)               ;; item must be described before moving
                    (at ?it ?from)
                    (not (= ?from ?to))
                  )
    :effect (and
              (not (at ?it ?from))
              (at ?it ?to)
            )
  )

  ;; Auditor inspects an item during the audit phase; item must be at a final location to be audited.
  (:action auditor_audit
    :parameters (?a - agent ?it - item ?l - location ?p - phase)
    :precondition (and
                    (role-auditor ?a)
                    (is-audit-phase ?p)
                    (current-phase ?p)
                    (at ?it ?l)
                    (is-final-location ?l)
                    (not (audited ?it))
                  )
    :effect (and
              (audited ?it)
            )
  )

  ;; Auditor performs repair when a repair phase is current; requires that the item was audited and needs repair.
  (:action auditor_repair
    :parameters (?a - agent ?it - item ?p - phase)
    :precondition (and
                    (role-auditor ?a)
                    (is-repair-phase ?p)
                    (current-phase ?p)
                    (audited ?it)
                    (needs-repair ?it)
                    (not (repaired ?it))
                  )
    :effect (and
              (repaired ?it)
              (not (needs-repair ?it))
            )
  )

  ;; Advance the current phase to the next phase; enforces the given ordering and contiguity.
  (:action advance_phase
    :parameters (?from - phase ?to - phase)
    :precondition (and
                    (current-phase ?from)
                    (next ?from ?to)
                  )
    :effect (and
              (not (current-phase ?from))
              (current-phase ?to)
            )
  )
)