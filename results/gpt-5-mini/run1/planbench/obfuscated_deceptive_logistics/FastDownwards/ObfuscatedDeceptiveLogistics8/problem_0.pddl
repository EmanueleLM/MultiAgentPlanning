(define (problem pddl_orchestrator_problem)
  (:domain pddl_orchestrator)

  ;; Objects from the inputs (canonicalized by the auditor)
  (:objects
    object_6 object_9 object_10 - object
  )

  ;; Initial state: no 'next' facts yet; capabilities granted per agent analyses.
  (:init
    ;; Capabilities derived from player.analysis and collector.analysis (conservative)
    (can_player_set object_10 object_6)
    (can_collector_set object_9 object_6)

    ;; No next relations exist initially (omitted because default is false).
    ;; No provenance or validation facts present initially.
  )

  ;; Goal: both immediate-successor relations must hold as terminal conditions.
  (:goal
    (and
      (next object_10 object_6)
      (next object_9 object_6)
    )
  )
)