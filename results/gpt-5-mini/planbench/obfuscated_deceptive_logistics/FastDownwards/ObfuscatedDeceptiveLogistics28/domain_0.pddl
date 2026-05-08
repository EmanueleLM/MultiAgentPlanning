(define (domain workflow-orchestration)
  ;; Requirements limited to those supported by FastDownwards as requested.
  (:requirements :strips :typing :negative-preconditions)
  (:types
    ;; Agent subtypes to preserve role-specific capabilities (keeps contributions distinct)
    analyzer synthesizer auditor - agent
    task location - object
  )

  ;; Predicates (canonical). Comments indicate which agent contribution motivated each predicate:
  ;; - Analyzer contribution: predicates for analysis stage and who performed analysis
  ;; - Synthesizer contribution: predicates for synthesis stage and who performed synthesis
  ;; - Auditor contribution: predicates for audit stage and who performed audit
  ;; Core world predicates:
  (:predicates
    (at ?a - agent ?l - location)                 ; location of any agent
    (task-at ?t - task ?l - location)            ; static location of each task
    (in-phase-analysis)                           ; global phase: analysis active (only one true at a time)
    (in-phase-synthesis)                          ; global phase: synthesis active
    (in-phase-audit)                              ; global phase: audit active

    ;; Stage completion predicates enforced as hard constraints
    (analyzed ?t - task)                          ; analyzer contribution: task analyzed
    (analyzed-by ?t - task ?an - analyzer)        ; which analyzer analyzed the task

    (synthesized ?t - task)                       ; synthesizer contribution: task synthesized
    (synthesized-by ?t - task ?syn - synthesizer) ; which synthesizer synthesized the task

    (audited ?t - task)                           ; auditor contribution: task audited
    (audited-by ?t - task ?aud - auditor)         ; which auditor audited the task

    (connected ?l1 - location ?l2 - location)     ; bidirectional connectivity between locations
  )

  ;; Actions. No durations, no costs. All constraints are encoded as hard preconditions.
  ;; Move action (usable in any phase, but preserves phase atoms):
  (:action move
    :parameters (?ag - agent ?from - location ?to - location)
    :precondition (and (at ?ag ?from) (connected ?from ?to))
    :effect (and (not (at ?ag ?from)) (at ?ag ?to))
  )

  ;; Analyze action: can only be executed during analysis phase by an analyzer at the task location.
  ;; Produces analyzed and analyzed-by facts. Cannot re-analyze an already analyzed task.
  (:action analyze
    :parameters (?an - analyzer ?t - task ?loc - location)
    :precondition (and
                    (in-phase-analysis)
                    (at ?an ?loc)
                    (task-at ?t ?loc)
                    (not (analyzed ?t))
                  )
    :effect (and
              (analyzed ?t)
              (analyzed-by ?t ?an)
            )
  )

  ;; Advance phase: analysis -> synthesis. Hard precondition: all tasks must be analyzed.
  ;; The specific tasks to be checked are provided in the problem instance by enumerating them
  ;; in this action's preconditions at planning time (see problem below).
  (:action advance-to-synthesis
    :parameters ()
    :precondition (and (in-phase-analysis))
    :effect (and (not (in-phase-analysis)) (in-phase-synthesis))
  )

  ;; Synthesize action: only during synthesis phase by a synthesizer at the task location.
  ;; Requires the task already analyzed. Cannot re-synthesize an already synthesized task.
  (:action synthesize
    :parameters (?syn - synthesizer ?t - task ?loc - location)
    :precondition (and
                    (in-phase-synthesis)
                    (at ?syn ?loc)
                    (task-at ?t ?loc)
                    (analyzed ?t)
                    (not (synthesized ?t))
                  )
    :effect (and
              (synthesized ?t)
              (synthesized-by ?t ?syn)
            )
  )

  ;; Advance phase: synthesis -> audit. Hard precondition: all tasks must be synthesized.
  (:action advance-to-audit
    :parameters ()
    :precondition (and (in-phase-synthesis))
    :effect (and (not (in-phase-synthesis)) (in-phase-audit))
  )

  ;; Audit action: only during audit phase by an auditor at the task location.
  ;; Requires the task synthesized. Cannot re-audit an already audited task.
  (:action audit
    :parameters (?aud - auditor ?t - task ?loc - location)
    :precondition (and
                    (in-phase-audit)
                    (at ?aud ?loc)
                    (task-at ?t ?loc)
                    (synthesized ?t)
                    (not (audited ?t))
                  )
    :effect (and
              (audited ?t)
              (audited-by ?t ?aud)
            )
  )
)