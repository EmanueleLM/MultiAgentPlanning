(define (domain orchestration-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent task phase)

  (:predicates
    ; Phases and phase progression
    (current-phase ?p - phase)
    (next ?p1 - phase ?p2 - phase)

    ; Task assignments and capabilities
    (assigned ?t - task ?a - agent)
    (can-perform ?a - agent ?t - task)

    ; Task lifecycle predicates
    (task-phase ?t - task ?from - phase ?to - phase) ; performing ?t moves from ?from to ?to
    (completed ?t - task)
    (reviewed ?t - task)

    ; Finalization marker
    (finalized)
  )

  ; Analyst A performs assigned preparation tasks, advancing the global phase according to the task-phase mapping.
  (:action analystA_perform
    :parameters (?a - agent ?t - task ?from - phase ?to - phase)
    :precondition (and
      (assigned ?t ?a)
      (can-perform ?a ?t)
      (task-phase ?t ?from ?to)
      (current-phase ?from)
      (next ?from ?to)
      (not (completed ?t))
      (not (finalized))
    )
    :effect (and
      (completed ?t)
      (not (current-phase ?from))
      (current-phase ?to)
    )
  )

  ; Analyst B performs assigned analysis tasks, advancing the global phase according to the task-phase mapping.
  (:action analystB_perform
    :parameters (?a - agent ?t - task ?from - phase ?to - phase)
    :precondition (and
      (assigned ?t ?a)
      (can-perform ?a ?t)
      (task-phase ?t ?from ?to)
      (current-phase ?from)
      (next ?from ?to)
      (not (completed ?t))
      (not (finalized))
    )
    :effect (and
      (completed ?t)
      (not (current-phase ?from))
      (current-phase ?to)
    )
  )

  ; Auditor reviews an analysis result. Review must occur when the global phase equals the 'to' phase of the analyzed task.
  (:action auditor_review
    :parameters (?a - agent ?t - task ?from - phase ?to - phase)
    :precondition (and
      (can-perform ?a ?t)
      (task-phase ?t ?from ?to)
      (current-phase ?to)
      (not (reviewed ?t))
      (not (finalized))
    )
    :effect (and
      (reviewed ?t)
    )
  )

  ; Orchestrator finalizes the process: requires both tasks completed and the analysis task reviewed, and advances the final phase.
  (:action orchestrator_finalize
    :parameters (?o - agent ?t1 - task ?t2 - task ?pfrom - phase ?pto - phase)
    :precondition (and
      (current-phase ?pfrom)
      (next ?pfrom ?pto)
      (completed ?t1)
      (completed ?t2)
      (reviewed ?t2)
      (not (finalized))
    )
    :effect (and
      (finalized)
      (not (current-phase ?pfrom))
      (current-phase ?pto)
    )
  )
)