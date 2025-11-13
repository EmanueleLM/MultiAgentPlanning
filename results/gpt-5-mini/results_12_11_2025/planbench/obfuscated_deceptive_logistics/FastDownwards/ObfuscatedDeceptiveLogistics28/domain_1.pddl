(define (domain orchestration_workflow)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent doc)

  (:predicates
    ;; availability of documents
    (available ?d - doc)
    ;; orchestrator requests
    (requested_env_public)
    (requested_planners_info)
    ;; fragments produced by planners
    (fragmentA_ready ?d - doc)
    (fragmentB_ready ?d - doc)
    ;; cleaned fragment artifact produced by auditor
    (clean_fragments_ready ?d - doc)
    ;; final compiled artifacts flags
    (compiled_domain)
    (compiled_problem)
  )

  ;; Orchestrator requests both environment public info and planner private info.
  (:action request_blocks_orchestrator
    :parameters ()
    :precondition (and (not (requested_env_public)) (not (requested_planners_info)))
    :effect (and (requested_env_public) (requested_planners_info))
  )

  ;; Environment posts the public information document in response to a request.
  (:action env_provide_public
    :parameters (?env_doc - doc)
    :precondition (and (requested_env_public) (not (available ?env_doc)))
    :effect (and (available ?env_doc))
  )

  ;; Planner A makes its private information available in response to the request.
  (:action plannerA_provide_private
    :parameters (?pa_doc - doc)
    :precondition (and (requested_planners_info) (not (available ?pa_doc)))
    :effect (and (available ?pa_doc))
  )

  ;; Planner B makes its private information available in response to the request.
  (:action plannerB_provide_private
    :parameters (?pb_doc - doc)
    :precondition (and (requested_planners_info) (not (available ?pb_doc)))
    :effect (and (available ?pb_doc))
  )

  ;; Planner A produces fragment A after both the public info and its private info are available.
  (:action produce_fragmentA_by_plannerA
    :parameters (?pa_doc - doc ?env_doc - doc ?fragA_doc - doc)
    :precondition (and (available ?pa_doc) (available ?env_doc) (not (fragmentA_ready ?fragA_doc)))
    :effect (and (fragmentA_ready ?fragA_doc) (available ?pa_doc) (available ?env_doc))
  )

  ;; Planner B produces fragment B after both the public info and its private info are available.
  (:action produce_fragmentB_by_plannerB
    :parameters (?pb_doc - doc ?env_doc - doc ?fragB_doc - doc)
    :precondition (and (available ?pb_doc) (available ?env_doc) (not (fragmentB_ready ?fragB_doc)))
    :effect (and (fragmentB_ready ?fragB_doc) (available ?pb_doc) (available ?env_doc))
  )

  ;; Auditor audits the two planner fragments and produces a cleaned fragment artifact.
  (:action auditor_audit
    :parameters (?fragA_doc - doc ?fragB_doc - doc ?clean_doc - doc)
    :precondition (and (fragmentA_ready ?fragA_doc) (fragmentB_ready ?fragB_doc) (not (clean_fragments_ready ?clean_doc)))
    :effect (and (clean_fragments_ready ?clean_doc))
  )

  ;; Orchestrator compiles the final domain/problem artifacts after cleaned fragments are available.
  (:action orchestrator_compile
    :parameters (?clean_doc - doc)
    :precondition (and (clean_fragments_ready ?clean_doc) (not (compiled_domain)) (not (compiled_problem)))
    :effect (and (compiled_domain) (compiled_problem))
  )
)