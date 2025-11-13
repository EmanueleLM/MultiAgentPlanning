(define (problem orchestration_workflow_instance)
  (:domain orchestration_workflow)
  (:objects
    orchestrator environment plannera plannerb - agent

    ;; documents and artifacts (explicit, no placeholders)
    env_public_doc plannera_private_doc plannerb_private_doc - doc
    fragmenta_doc fragmentb_doc clean_fragments_doc - doc

    ;; explicit ordered stages for workflow progression
    s0 s1 s2 - stage
  )

  (:init
    ;; explicit stage order relations (succ defines legal progression)
    (succ s0 s1)
    (succ s1 s2)

    ;; initial workflow is at stage s0 (request not yet made)
    (stage_reached s0)

    ;; no documents or artifacts available initially (available facts absent)
    ;; compiled artifacts absent by default
  )

  (:goal (and
    (compiled_domain)
    (compiled_problem)
  ))
)