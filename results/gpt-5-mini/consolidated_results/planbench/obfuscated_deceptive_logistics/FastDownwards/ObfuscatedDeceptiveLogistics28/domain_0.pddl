(define (domain orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent doc)

  (:predicates
    ;; Document availability
    (available ?d - doc)
    ;; Explicit request flags to enforce ordering
    (requested_env_public)
    (requested_planners_info)
    ;; Fragments produced by the orchestrator
    (fragment_ready ?d - doc)
    ;; Final compiled artifacts
    (compiled_domain)
    (compiled_problem)
  )

  ;; The orchestrator explicitly requests the two required data blocks.
  ;; This makes subsequent provide actions depend on a prior request, enforcing order.
  (:action request_blocks_orchestrator
    :parameters ()
    :precondition (and (not (requested_env_public)))
    :effect (and (requested_env_public) (requested_planners_info))
  )

  ;; The environment posts the public information document in response to a request.
  ;; Can be applied to any doc object; in the problem instance the intended object is env_public_doc.
  (:action env_provide_public
    :parameters (?d - doc)
    :precondition (and (requested_env_public) (not (available ?d)))
    :effect (and (available ?d))
  )

  ;; Planner B posts its private initial facts and produced plan.
  ;; In the problem instance the intended object is plannerB_private_doc.
  (:action plannerB_provide_private
    :parameters (?d - doc)
    :precondition (and (requested_planners_info) (not (available ?d)))
    :effect (and (available ?d))
  )

  ;; Planner A posts its private initial facts and/or produced plan.
  ;; In the problem instance the intended object is plannerA_private_doc.
  (:action plannerA_provide_private
    :parameters (?d - doc)
    :precondition (and (requested_planners_info) (not (available ?d)))
    :effect (and (available ?d))
  )

  ;; The orchestrator produces fragment_B after both the environment public info
  ;; and planner B's private info are available. The fragment object is provided
  ;; as a parameter so its identity is explicit in the grounded plan.
  (:action produce_fragmentB_orchestrator
    :parameters (?env_doc - doc ?pb_doc - doc ?frag_doc - doc)
    :precondition (and (available ?env_doc) (available ?pb_doc) (not (fragment_ready ?frag_doc)))
    :effect (and (fragment_ready ?frag_doc))
  )

  ;; The orchestrator produces fragment_A after environment public info
  ;; and planner A's private info are available.
  (:action produce_fragmentA_orchestrator
    :parameters (?env_doc - doc ?pa_doc - doc ?frag_doc - doc)
    :precondition (and (available ?env_doc) (available ?pa_doc) (not (fragment_ready ?frag_doc)))
    :effect (and (fragment_ready ?frag_doc))
  )

  ;; The orchestrator compiles the final domain and problem only after both fragments are ready.
  ;; The compiled artifacts are modeled as boolean goal predicates compiled_domain and compiled_problem.
  (:action compile_domain_problem_by_orchestrator
    :parameters (?fragA - doc ?fragB - doc)
    :precondition (and (fragment_ready ?fragA) (fragment_ready ?fragB) (not (compiled_domain)) (not (compiled_problem)))
    :effect (and (compiled_domain) (compiled_problem))
  )
)