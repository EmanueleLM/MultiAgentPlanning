(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item phase)

  ;; Predicates
  (:predicates
    (is-agent ?a - agent)

    ;; Phase control
    (at-phase ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)

    ;; Data artifacts and states
    (obs-collected ?o - item)
    (rules-normalized ?r - item)
    (audit-completed ?r - item)
    (report-generated ?rep - item)
    (approved ?rep - item)
    (published ?rep - item)
  )

  ;; Assistant actions (prefixed assistant-)
  (:action assistant-collect-observation
    :parameters (?assistant - agent ?o - item ?p - phase)
    :precondition (and
                    (is-agent ?assistant)
                    (at-phase ?p)
                    (not (obs-collected ?o))
                  )
    :effect (and
              (obs-collected ?o)
            )
  )

  (:action assistant-normalize-rules
    :parameters (?assistant - agent ?o - item ?r - item ?p - phase)
    :precondition (and
                    (is-agent ?assistant)
                    (at-phase ?p)
                    (obs-collected ?o)
                    (not (rules-normalized ?r))
                  )
    :effect (and
              (rules-normalized ?r)
            )
  )

  (:action assistant-generate-report
    :parameters (?assistant - agent ?r - item ?rep - item ?p - phase)
    :precondition (and
                    (is-agent ?assistant)
                    (at-phase ?p)
                    (rules-normalized ?r)
                    (not (report-generated ?rep))
                  )
    :effect (and
              (report-generated ?rep)
            )
  )

  ;; Auditor actions (prefixed auditor-)
  (:action auditor-audit
    :parameters (?auditor - agent ?r - item ?p - phase)
    :precondition (and
                    (is-agent ?auditor)
                    (at-phase ?p)
                    (rules-normalized ?r)
                    (not (audit-completed ?r))
                  )
    :effect (and
              (audit-completed ?r)
            )
  )

  ;; Player actions (prefixed player-)
  ;; Advance the current phase, but only allowed when required artifacts from the
  ;; prior phase are present. This enforces ordered, contiguous progression.
  (:action player-advance-phase
    :parameters (?player - agent ?from - phase ?to - phase)
    :precondition (and
                    (is-agent ?player)
                    (at-phase ?from)
                    (phase-next ?from ?to)
                    ;; phase-specific completion requirements:
                    ;; from p1 -> p2 requires at least one observation collected
                    ;; from p2 -> p3 requires normalization completed
                    ;; from p3 -> p4 requires audit completed and report generated
                    (or
                      ;; generic case: if not any of the named pairs, allow only if from has no unmet constraints
                      (and (not (phase-next p1 p2)) (not (phase-next p2 p3)) (not (phase-next p3 p4)))
                      (and (phase-next p1 p2) (or (not (= ?from p1)) (obs-collected obs1)))
                      (and (phase-next p2 p3) (or (not (= ?from p2)) (rules-normalized rules1)))
                      (and (phase-next p3 p4) (or (not (= ?from p3)) (and (audit-completed rules1) (report-generated report1))))
                    )
                  )
    :effect (and
              (at-phase ?to)
              (not (at-phase ?from))
            )
  )

  (:action player-approve-report
    :parameters (?player - agent ?rep - item ?p - phase)
    :precondition (and
                    (is-agent ?player)
                    (at-phase ?p)
                    (report-generated ?rep)
                    (audit-completed rules1)
                    (not (approved ?rep))
                  )
    :effect (and
              (approved ?rep)
            )
  )

  (:action player-publish-report
    :parameters (?player - agent ?rep - item ?p - phase)
    :precondition (and
                    (is-agent ?player)
                    (at-phase ?p)
                    (approved ?rep)
                    (not (published ?rep))
                  )
    :effect (and
              (published ?rep)
            )
  )
)