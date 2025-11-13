(define (problem orchestration_workflow_instance)
  (:domain orchestration_workflow)
  (:objects
    orchestrator environment plannerA plannerB - agent

    ;; documents and artifacts (distinct objects, no placeholders)
    env_public_doc plannerA_private_doc plannerB_private_doc - doc
    fragmentA_doc fragmentB_doc clean_fragments_doc - doc

    ;; explicit ordered stages for workflow progression
    s0 s1 s2 - stage
  )

  (:init
    ;; explicit stage order relations
    (succ s0 s1)
    (succ s1 s2)

    ;; initial workflow is at stage s0 (request not yet made)
    (stage_reached s0)

    ;; no documents or artifacts available initially: available/fragment*/clean* absent by default
    ;; compiled artifacts absent by default
  )

  (:goal (and
    (compiled_domain)
    (compiled_problem)
  ))
)