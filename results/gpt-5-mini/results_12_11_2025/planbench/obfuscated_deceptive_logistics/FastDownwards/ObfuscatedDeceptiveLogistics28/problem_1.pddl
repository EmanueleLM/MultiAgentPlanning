(define (problem orchestration_workflow_instance)
  (:domain orchestration_workflow)
  (:objects
    orchestrator environment plannerA plannerB - agent
    env_public_doc plannerA_private_doc plannerB_private_doc - doc
    fragmentA_doc fragmentB_doc clean_fragments_doc - doc
  )

  (:init
    ;; Initially: no requests, no docs available, nothing compiled.
    ;; All facts are false by default; we list none to assert their absence explicitly.
  )

  ;; Goal: require the orchestrator to have produced the compiled artifacts.
  ;; This enforces completion of the full workflow: request -> provides -> fragments -> audit -> compile.
  (:goal (and
    (compiled_domain)
    (compiled_problem)
  ))
)