(define (problem orchestration-instance)
  (:domain orchestration)
  (:objects
    orchestrator environment plannerA plannerB - agent
    env_public_doc plannerB_private_doc plannerA_private_doc - doc
    fragmentB_doc fragmentA_doc - doc
  )

  (:init
    ;; Initially no documents are available, no requests made, no fragments, and nothing compiled.
    ;; All ordering and availability is driven by actions.
  )

  ;; Goal: both fragments must be produced and both compiled artifacts must be produced.
  ;; This enforces completion of every mandated terminal condition.
  (:goal (and
    (fragment_ready fragmentA_doc)
    (fragment_ready fragmentB_doc)
    (compiled_domain)
    (compiled_problem)
  ))
)