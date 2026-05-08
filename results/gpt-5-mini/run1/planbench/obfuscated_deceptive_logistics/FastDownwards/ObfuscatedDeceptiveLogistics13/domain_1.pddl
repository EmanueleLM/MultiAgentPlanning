(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent item phase)

  (:predicates
    (is-agent ?a - agent)
    (at-phase ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)
    (obs-collected ?o - item)
    (rules-normalized ?r - item)
    (audit-completed ?r - item)
    (report-generated ?rep - item)
    (approved ?rep - item)
    (published ?rep - item)
  )

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

  (:action player-advance-p1-p2
    :parameters (?actor - agent ?from - phase ?to - phase ?obs - item)
    :precondition (and
                    (is-agent ?actor)
                    (at-phase ?from)
                    (phase-next ?from ?to)
                    (obs-collected ?obs)
                  )
    :effect (and
              (at-phase ?to)
              (not (at-phase ?from))
            )
  )

  (:action player-advance-p2-p3
    :parameters (?actor - agent ?from - phase ?to - phase ?r - item)
    :precondition (and
                    (is-agent ?actor)
                    (at-phase ?from)
                    (phase-next ?from ?to)
                    (rules-normalized ?r)
                  )
    :effect (and
              (at-phase ?to)
              (not (at-phase ?from))
            )
  )

  (:action player-advance-p3-p4
    :parameters (?actor - agent ?from - phase ?to - phase ?r - item ?rep - item)
    :precondition (and
                    (is-agent ?actor)
                    (at-phase ?from)
                    (phase-next ?from ?to)
                    (audit-completed ?r)
                    (report-generated ?rep)
                  )
    :effect (and
              (at-phase ?to)
              (not (at-phase ?from))
            )
  )

  (:action player-approve-report
    :parameters (?player - agent ?rep - item ?r - item ?p - phase)
    :precondition (and
                    (is-agent ?player)
                    (at-phase ?p)
                    (report-generated ?rep)
                    (audit-completed ?r)
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